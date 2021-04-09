#!/usr/bin/env ruby
require_relative '../lib/scraper'

puts 'Hello there'
puts 'Welcome to Crappy\'s StackOverflow job Scraper'
puts
puts 'What is your name?'
name = gets.chomp
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
