require 'nokogiri'
require 'open-uri'
require 'csv'

class Scraper
  attr_reader :jobs, :url

  def initialize
    @jobs = []
    @url = 'https://stackoverflow.com/jobs'
  end

  def parse_site(url)
    unparsed_site = URI.open(url)
    Nokogiri::HTML(unparsed_site)
  end
end
