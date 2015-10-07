#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)

end

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)

end

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)

end

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)

end

# Problem 5: countdown should call itself recursively sleeping for 1 second each
# time. *Hint* use sleep(n).

def countdown(n)

end

# Problem 6: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)

end

# Problem 7: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)

end

# Problem 8: Write a recursive function to calculate exponents! Don't use
# the built-in ** offered by ruby

def exp(base,pow)

end

# Problem 9: Write a function that returns *array* holding the first N amount of
# fibonacci numbers. See: https://en.wikipedia.org/wiki/Fibonacci_number

def fibonacci(num)

end

# Problem 10: Write a recursive binary search: bsearch(array, target).
# Note that binary search only works on sorted arrays. Make sure to return
# the location of the found object (or nil if not found!).

def bsearch(array, target)

end

# Problem 11: Your function should always return the optimal change with optimal
# being the least amount of coins involved. The coins variable is an array of
# coin types. Assume you have infinite coins to make change with.

def make_change(amount, coins)

end

# Problem 12: Implement an Integer method, to_roman, that converts an Integer
# into a Roman Numeral. A hash of the Roman Numerals is provided below.

class Integer
  ROMAN_MAPPING = { 1000 => "M",
                    900 => "CM",
                    500 => "D",
                    400 => "CD",
                    100 => "C",
                    90 => "XC",
                    50 => "L",
                    40 => "XL",
                    10 => "X",
                    9 => "IX",
                    5 => "V",
                    4 => "IV",
                    1 => "I" }
  def to_roman

  end
end

# Problem 13: Implement a method selection_sort that uses a selection method
# as a helper. See: https://en.wikipedia.org/wiki/Selection_sort

def selection_sort(array, &prc)

end

def selection(array, &prc)

end

# Problem 14: Implement a method merge_sort that sorts an Array recursively
# see: https://en.wikipedia.org/wiki/Merge_sort

class Array
  def merge_sort(&prc)

  end

  private
  def self.merge(left, right, &prc)

  end
end
