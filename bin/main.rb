#!/usr/bin/env ruby
require_relative '../lib/scraper'
require_relative '../lib/user'
# require_relative '../lib/sort'

puts 'Hello there'
puts 'Welcome to Crappy\'s StackOverflow job Scraper'
puts
user = User.new
puts 'What is your name?'
puts
validation = false
while validation == false
  name = gets.chomp
  validation = user.validate(name)
  p 'Please, enter a valid name' if validation == false
end
puts
puts
sort = Scraper.new
puts 'By what query would you like your search to be done?'
puts
puts
puts '"Title" for Job title || "Company" for Job company || "Tag" for Language tag ||"None" for all job listings.'
puts
puts
selection = false
while selection == false
  option = gets.chomp.downcase
  if sort.option_check(option)
    puts "What  #{option} do you want to search for?"
    puts
    query = gets.chomp.downcase
    selection = sort.option_check(option)
  end
  selection = true if option == 'none'
  p option
  p selection
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

sort.scrape
sort.group(option, query)
sort.result
puts
