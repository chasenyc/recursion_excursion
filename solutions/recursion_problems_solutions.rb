#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
  return 0 if array.empty?
  sum_recur(array.drop(1)) + array.first
end

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return false if array.empty?
  return true if array.first == target
  includes?(array.drop(1), target)
end

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 0 if array.empty?
  count_update = array.first == target ? 1 : 0
  count_update + num_occur(array.drop(1), target)
end

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.length <= 1
  return true if array[0] + array[1] == 12
  add_to_twelve?(array.drop(1))
end

# Problem 5: countdown should call itself recursively sleeping for 1 second each
# time. *Hint* use sleep(n).

def countdown(n)
  return if n <=0
  sleep(n)
  countdown(n-1)
end

# Problem 6: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
  return true if array.length <= 1
  return false if array[0] > array[1]
  sorted?(array.drop(1))
end

# Problem 7: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string.slice(1, string.length - 2)) + string[0]
end

# Problem 8: Write a recursive function to calculate exponents! Don't use
# the built-in ** offered by ruby

def exp(base,pow)
  return 1 if pow == 0
  result = num * exp(num, pow - 1)
end

# Problem 9: Write a function that returns array holding the first N amount of
# fibonacci numbers. See: https://en.wikipedia.org/wiki/Fibonacci_number

def fibonacci(num)
  return [] if num == 0
  return [1] if num == 1
  return [1,1] if num == 2
  fibonacci(num-1) << fibonacci(num-1)[-2..-1].inject(:+)
end

# Problem 10: Write a recursive binary search: bsearch(array, target).
# Note that binary search only works on sorted arrays. Make sure to return
# the location of the found object (or nil if not found!).

def bsearch(array, target)
  return (array.size - 1) if target == array.last
  return nil if array.empty?
  bsearch(array.take(array.size-1), target)
end

# Problem 11: Your function should always return the optimal change with optimal
# being the least amount of coins involved. The coins variable is an array of
# coin types. Assume you have infinite coins to make change with.
# THIS SOLUTION NEEDS TO BE CLEANED UP

def make_change(amount, coins)
  return [] if coins.size == 0
  result = []
  remainder = amount
  while remainder > 0
    coins.each do |coin|
      while remainder >= coin
        remainder -= coin
        result << coin
      end
    end
  end
  if make_change(amount, coins[1..-1]).size < result.size &&
                    !make_change(amount, coins[1..-1]).empty?
    return make_change(amount, coins[1..-1])
  else
    result
  end
end

# Problem 12: Implement an Integer method, to_roman, that converts an Integer
# into a Roman Numeral. A hash of the Roman Numerals is provided below.
# SOLUTION MIGHT NOT BE OPTIMAL

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
    return "" if self == 0
    return "I" if self == 1
    largest = 0
    ROMAN_MAPPING.each do |k,v|
      largest = k if k <= self && k > largest
    end
    quotient = self / largest
    ROMAN_MAPPING[largest] * quotient << (self-(largest*quotient)).to_roman
  end
end

# Problem 13: Implement a method selection_sort that uses a selection method
# as a helper. See: https://en.wikipedia.org/wiki/Selection_sort

def selection_sort(array, &prc)
  return array if array.size < 2
  prc ||= Proc.new { |x,y| x <=> y }
  new_arr = array.dup
  first_item = selection(new_arr, &prc)
  new_arr.delete_at(new_arr.find_index(first_item))
  [first_item].concat(selection_sort(new_arr, &prc))
end

def selection(array, &prc)
  lowest = array.first
  array.each do |el|
    lowest = el if  prc.call(lowest, el) == 1
  end
  lowest
end

# Problem 14: Implement a method merge_sort that sorts an Array recursively
# see: https://en.wikipedia.org/wiki/Merge_sort

class Array
  def merge_sort(&prc)
    return self if length < 2
    prc ||= Proc.new { |x,y| x <=> y }
    left_half = take(length / 2)
    right_half = drop(length / 2)
    Array.merge(left_half.merge_sort(&prc), right_half.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    results = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
        when -1
          results.concat([left.shift])
        when 0
          results.concat([left.shift]).concat([right.shift])
        when 1
          results.concat([right.shift])
      end
    end
    results.concat(left).concat(right)
  end
end
