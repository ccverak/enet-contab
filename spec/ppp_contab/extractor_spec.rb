require 'spec_helper'

module PppContab
  describe Extractor do
    let(:doc) { File.join(File.dirname(__FILE__), '../fixtures/contab_actual.html') }
    let(:extractor) { Extractor.new(doc) }

    it "knows the default URIs to extract data from" do
      extractor.urls.should include(
        "http://home.enet.cu/herramientas/contabilidad.html")
    end

    it "extracts the total time of connections" do
      extractor.total.should == "58:27:13"
    end

    xit "returns the number of connections" do
      extractor.number_of_connections.should be
    end

    it "extracts the consumed time for each number" do
      durations = extractor.connection_durations
      durations.should have_key('77653458')
      durations.should have_key('77631178')
    end

    it "returns the duration time for a specified number" do
      totals = extractor.total_by_number
      totals['77653458'].should be_within(0.5).of(22)
    end

    it "closely matches the reported total in the page" do
      totals = extractor.total_by_number
      total = 0
      totals.each do |number, duration|
        total += duration
      end
      parsed_total = extractor.total.split(":")[0..1].join(".").to_f
      total.should be_within(0.5).of(parsed_total)
    end
  end
end
