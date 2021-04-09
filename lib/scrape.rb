require 'nokogiri'
require 'open-uri'

class StackOverflow
  attr_reader :jobs, :url

  def initialize
    @jobs = []
    @url = 'https://stackoverflow.com/jobs'
  end
end