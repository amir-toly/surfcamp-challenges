require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.

answer_from_coach = 'What do you have to say son?'

while answer_from_coach != ''
  puts answer_from_coach
  answer_from_coach = coach_answer_enhanced(gets.chomp)
end
