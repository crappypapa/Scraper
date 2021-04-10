#!/usr/bin/env ruby
require_relative '../lib/scraper'
require_relative '../lib/user'

puts 'Hello there'
puts 'Welcome to Crappy\'s StackOverflow job Scraper'
puts
user = User.new
puts 'What is your name?'
validation = false
while validation == false
  name = gets.chomp
  validation = user.validate(name)
  p 'Please, enter a valid name' if validation == false
end
puts
puts "#{name}, Have a donut while I scrape the Job listings on Stack-Overflow"
puts
puts
puts 'scraping...'
puts 'scraping...'
puts 'scraping...'
site = Scraper.new
site.scrape
site.result
puts
puts
puts 'Scraping successfully completed'
puts 'The results are in the "StackOverflow.csv" file'
