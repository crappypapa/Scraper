#!/usr/bin/env ruby
require_relative '../lib/scraper'
require_relative '../lib/user'
require_relative '../lib/sort'

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
puts
sort = Sorter.new
puts 'By what query would you like your search to be done?'
puts
puts
puts '"Title" for Job title || "Company" for Job company || "Tag" for Language tag ||"None" for all job listings.'
selection = false
while selection == false
  option = gets.chomp.downcase
  selection = true if option == "none"
  if sort.option_check(option) 
    puts "What #{option} do you want to search for?"
    @query = gets.chomp.downcase
  end
  selection = sort.option_check(option)
  p 'Please, select one of the options listed above' if selection == false
end
puts
puts
puts 'Alright!'
puts "#{name}, Have a donut while I scrape the Job listings on Stack-Overflow based on your query"
puts
puts
puts 'scraping...'
puts 'scraping...'
puts 'scraping...'
# site = Scraper.new
# site.scrape
# site.result
# puts
puts

puts 'Scraping successfully completed'
puts 'The results are in the "StackOverflow.csv" file'
