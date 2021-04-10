require_relative '../lib/scraper'
require_relative '../lib/user'

describe User do
  describe '#validate' do
    it 'it returns false if user inputs a blank name' do
      user = User.new
      expect(user.validate('')).to eql(false)
    end

    it 'checks and returns true if name given is not blank' do
      user = User.new
      expect(user.validate('ola')).to eql(true)
    end
  end
end

describe Scraper do
  let(:site) { Scraper.new }
  describe 'initialize' do
    it 'sets url to a string value' do
      expect(site.url).to be_a(String)
    end

    it 'initializes a job array' do
      expect(site.jobs).to be_a(Array)
    end
  end

  describe '#result' do
    filepath = 'StackOverflow.csv'
    csv_options = { headers: :first_row, col_sep: ',' }
    let(:csv) { CSV.open(filepath, 'wb', csv_options) }
    let(:update_csv) { csv << [a[:job_title], a[:job_company], a[:job_time_posted]] }

    it 'creates and updates csv sheet' do
      site.result
      expect(csv).to_not be_nil
    end
  end
end
