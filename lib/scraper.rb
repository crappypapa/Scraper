require 'nokogiri'
require 'open-uri'
require 'csv'

class Scraper
  attr_reader :jobs, :url

  def initialize
    @jobs = []
    @url = 'https://stackoverflow.com/jobs'
  end

  def scrape
    parsed_page = parse_site(@url)
    job_listing = parsed_page.css('div.-job.js-result.js-dismiss-overlay-container.ps-relative.p12.pl24')
    total = job_listing.count
    i = 1
    while i <= total
      job_listing.each do |job|
        job = {
          job_title: job.css('.stretched-link').text,
          job_tag: job.css('.no-tag-menu').text,
          job_company: job.css('h3.fc-black-700.fs-body1.mb4 span').text,
          job_time_posted: job.css('span.fc-orange-400.fw-bold').text
        }
        @jobs << job
      end
      i += 1
    end
  end

  def result
    jobs = @jobs
    filepath = 'StackOverflow.csv'
    csv_options = { headers: :first_row, col_sep: ',' }
    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['Title','Job_Tag' ,'Company', 'Time Posted']
      jobs.each do |a|
        csv << [a[:job_title],a[:job_tag], a[:job_company], a[:job_time_posted]]
      end
    end
  end

  private

  def parse_site(url)
    unparsed_site = URI.parse(url).open
    Nokogiri::HTML(unparsed_site)
  end
end
