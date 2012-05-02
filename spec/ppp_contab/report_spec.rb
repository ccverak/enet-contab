require 'spec_helper'

module PppContab
  describe Report do
    xit "builds a report using an Extractor" do
      extractor = mock('extractor')
      extractor.should_receive(:number_of_connections).and_return(5)
      reporter = Report.new(extractor, nil)
      reporter.build
    end
  end
end
