require_relative "compute_name"

def ask_and_get(param)
  #TODO:
  #- Ask the user to write a value for param
  #- Get and return the string inputted by the user
  puts 'Hi! Can you give me your ' + param + '?'
  gets.chomp.to_s
end

def name_from_terminal
  first_name = ask_and_get("first name")
  second_name = ask_and_get("middle name")
  last_name = ask_and_get("last name")

  compute_name(first_name, second_name, last_name)
end

full_name = name_from_terminal

#TODO: use string concatenation to build a custom message embedding the computed full_name

custom_message = 'Hello, ' + full_name + '! It\'s a ' + full_name.length.to_s + ' characters long name...'

puts custom_message
