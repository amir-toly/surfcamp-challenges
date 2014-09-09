def shuffle_word(a_word)
  #TODO: refactor this method

  a_word.upcase.chars.to_a.shuffle

end


def quote_prime_numbers(n)
  #TODO: refactor this method

  prime_numbers = (1..n).find_all {|i|
    divisors_except_one = (2..i-1).select {|k|
      divisible_by?(i, k)
    }

    divisors_except_one.count == 0
  }

  prime_numbers.map{ |prime_num|
    "#{prime_num} is prime"
  }
end

def divisible_by?(a, b)
  a % b == 0
end
