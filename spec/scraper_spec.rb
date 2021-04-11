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
  let(:sort) { Scraper.new }
  describe 'initialize' do
    it 'sets url to a string value' do
      expect(sort.url).to be_a(String)
    end

    it 'initializes a job array' do
      expect(sort.jobs).to be_a(Array)
    end
  end

  describe '#option_check' do
    it 'checks if option input is in pre-defined array' do
      @options = %w[title company tag]
      expect(@options.include?('company')).to eql(true)
    end

    it 'checks if option input is not in pre-defined array' do
      @options = %w[title company tag]
      expect(@options.include?('pay')).to eql(false)
    end
  end

  describe '#group' do
    it "should call 'bar' with appropriate arguments" do
      option = 'option'
      query = 'query'
      expect(sort).to receive(:group).with(option, query)
      sort.group(option, query)
    end
  end

  describe '#result' do
    filepath = 'StackOverflow.csv'
    csv_options = { headers: :first_row, col_sep: ',' }
    let(:csv) { CSV.open(filepath, 'wb', csv_options) }
    let(:update_csv) { csv << [a[:job_title], a[:job_company], a[:job_time_posted]] }

    it 'creates and updates csv sheet' do
      sort.result
      expect(csv).to_not be_nil
    end
  end
end
