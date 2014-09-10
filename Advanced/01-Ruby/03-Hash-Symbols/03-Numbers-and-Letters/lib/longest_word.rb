require 'open-uri'
require 'json'

def generate_grid(grid_size)
  #TODO: generate random grid of letters
  ('A'..'Z').to_a.shuffle[0...grid_size]
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result
  {
    time: (end_time - start_time),
    translation: "Look at wordreference.com",
    score: "any idea?",
    message: "well done"
  }
end
