require_relative '../lib/scraper'
#require_relative '../bin/main'

describe Scraper do
  let (:site) {Scraper.new}
  describe 'initialize' do
    it 'sets url to a string value' do
      expect(site.url).to be_a(String)
    end

    it 'initializes a job array' do
      expect(site.jobs).to be_a(Array)
    end
  end
end