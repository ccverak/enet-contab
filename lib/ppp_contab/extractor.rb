require 'open-uri'
require 'nokogiri'

module PppContab
  class Extractor
    START_DATE_SELECTOR   = 'td:nth-child(1)'
    START_TIME_SELECTOR   = 'td:nth-child(2)'
    END_DATE_SELECTOR     = 'td:nth-child(3)'
    END_TIME_SELECTOR     = 'td:nth-child(4)'
    PHONE_NUMBER_SELECTOR = 'td:nth-child(5) div'
    ROW_TOTAL_SELECTOR    = 'td:nth-child(6)'
    FULL_TOTAL_SELECTOR   = 'h5 font'
    CONNECTIONS_SELECTOR  = 'table[bordercolor="#9999CC"]'

    attr_reader :doc

    def initialize(source=nil)
      source = Nokogiri::HTML(open(source)) unless source.kind_of? Nokogiri::HTML
      @doc = source
    end

    def total
      @total ||= @doc.at_css(FULL_TOTAL_SELECTOR).text
    end

    def total_by_number
      connection_durations unless @durations
      @total_by_number ||= {}
      @durations.each do |number, durations|
        total = durations.inject(0) { |duration, count| count += duration }
        @total_by_number[number] = total / 3600.0
      end
      @total_by_number
    end

    def connection_durations
      @durations = {}
      table = @doc.at_css(CONNECTIONS_SELECTOR)
      table.css('tr').each do |row|
        number   = row.css(PHONE_NUMBER_SELECTOR).text.strip
        duration = row.css(ROW_TOTAL_SELECTOR).text.strip

        unless number.empty? || duration.empty?
          start_at_str =
            [row.css(START_DATE_SELECTOR), row.css(START_TIME_SELECTOR)].                map(&:text).join(" ")
          end_at_str =
            [row.css(END_DATE_SELECTOR), row.css(END_TIME_SELECTOR)].
              map(&:text).join(" ")

          start_at = Time.parse(start_at_str)
          end_at = Time.parse(end_at_str)

          (@durations[number] ||= []) << (end_at - start_at)
        end
      end

      @durations
    end

    def urls
      ["http://home.enet.cu/herramientas/contabilidad.html"]
    end
  end
end
