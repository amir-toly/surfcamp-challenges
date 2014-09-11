def group_anagrams(words)
  #TODO: group anagrams
  my_hash = words.group_by { |word| word.downcase.split("").sort }
  my_hash.values
end

# input:
p group_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )

# =>  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
