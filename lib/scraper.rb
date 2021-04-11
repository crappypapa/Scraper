require 'nokogiri'
require 'open-uri'
require 'csv'
#require_relative '../bin/main'


class Scraper
  attr_reader :jobs, :url, :query, :option

  def initialize
    @jobs = []
    @option = option
    @job_sorted = Array.new
    @url = 'https://stackoverflow.com/jobs'
    @query = query
    @options = ['title', 'company','tag']
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

  def sort(option, query)
    if option == "company" 
      @job_sorted << @jobs.select {|a| a[:job_company].downcase.match(/#{Regexp.quote("#{query}")}/)}
    elsif option == "title"
     @job_sorted << @jobs.select {|a| a[:job_title].downcase.match(/#{Regexp.quote("#{query}")}/)}
    elsif option == "tag"
      @job_sorted << @jobs.select {|a| a[:job_tag].downcase.match(/#{Regexp.quote("#{query}")}/)}
    end
  end
  
  def option_check(option)
    @options.include? option
  end

  def query_title(query)
   @jobs.select {|a| a[:job_title].downcase.match(/#{Regexp.quote("#{query}")}/)}
  end
 
  def query_tag(query)
   @jobs.select {|a| a[:job_tag].downcase.match(/#{Regexp.quote("#{query}")}/)}
  end

  def query_company(query)
   @jobs.select {|a| a[:job_company].downcase.match(/#{Regexp.quote("#{query}")}/)}
  end


  def result
    job_sorted = @job_sorted.flatten
    filepath = 'StackOverflow.csv'
    csv_options = { headers: :first_row, col_sep: ',' }
    if job_sorted.length > 0
      CSV.open(filepath, 'wb', csv_options) do |csv|
        csv << ['Title','Job_Tag' ,'Company', 'Time Posted']
        job_sorted.each do |a|
          csv << [a[:job_title],a[:job_tag], a[:job_company], a[:job_time_posted]]
        end
      end
      puts 'Scraping successfully completed'
      puts 'The results are in the "StackOverflow.csv" file'
    else
      puts "I am unable to find valid matches at this time, Try again later."
    end
  end

  private

  def parse_site(url)
    unparsed_site = URI.parse(url).open
    Nokogiri::HTML(unparsed_site)
  end
end
