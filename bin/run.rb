#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)

puts "Would You like to make another search (Y/N)"
user_input = gets.chomp
while user_input == "Y"
    character = character = get_character_from_user
    show_character_movies(character)
    puts "Would you like to make another search (Y/N)"
    user_input = gets.chomp
end

if user_input == "N"
    puts "Goodbye"
end
    
