def roman_to_integer(roman_string)
  #TODO: translate roman string to integer
  roman_numbers ={
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

my_numbers_array = []

roman_string.split('').each do |nombre|
  roman_numbers.each do |key,value|
    if nombre == key
        my_numbers_array << value
    end
  end
end
if my_numbers_array.size == 2
    if my_numbers_array[0] < my_numbers_array[1]
      my_numbers_array[0] = - my_numbers_array[0]
    end
else
  for i in 1..my_numbers_array.size-2
    if my_numbers_array[i] < my_numbers_array[i+1] && my_numbers_array[i] != my_numbers_array[i-1]
      my_numbers_array[i] = - my_numbers_array[i]
    end
  end
end
my_numbers_array.inject{|sum,x| sum + x }
end

# testing your program
puts roman_to_integer('IV') == 4 # => true
puts roman_to_integer('XII') == 12 # => true
puts roman_to_integer('XIX') == 19 # => true
puts roman_to_integer('XVIII')
