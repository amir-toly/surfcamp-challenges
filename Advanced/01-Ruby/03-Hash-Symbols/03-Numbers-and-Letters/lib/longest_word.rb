require 'open-uri'
require 'json'

def generate_grid(grid_size)
  #TODO: generate random grid of letters
  ('A'..'Z').to_a.sample(grid_size)
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result
  translation_json = "N/A"

  open("http://api.wordreference.com/0.8/80143/json/enfr/" + attempt) do |stream|
    translation_json = JSON.parse(stream.read)
  end

  if translation_json == "N/A" || translation_json["Error"] == "NoTranslation"
    translation = "N/A"
  else
    translation = translation_json["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
  end

  attempt_array = attempt.chars

  in_grid = attempt_array.all? { |letter| grid.include?(letter) }

  {
    time: (end_time - start_time),
    translation: translation,
    score: "any idea?",
    message: "well done"
  }
end
