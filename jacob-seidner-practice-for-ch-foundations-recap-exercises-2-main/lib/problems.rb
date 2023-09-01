# Write a method, least_common_multiple, that takes in two numbers and returns
# the smallest number that is a mutiple of both of the given numbers
def least_common_multiple(num_1, num_2)
  answer_found = false
  if num_1 == num_2
    return num_1
  elsif num_1 < num_2
    i = num_2
    j = num_2
  elsif num_1 > num_2
    i = num_1
    j = num_1
  end
  while answer_found == false
    if i % num_1 == 0 && i % num_2 == 0
      answer_found = true
      return i
    end
    i += j
  end
  #While the code itself may seem unnessassarrily complicated,
  #it should accomplish the task in the minimum amount of
  #iterations, as this method only iterates through multiples
  #of the larger number. After definition, "j" serves a constant
  #representing the larger of the two arguments while "i"
  #iterates through that number's multiples.
end
p least_common_multiple(4 , 7)

# Write a method, most_frequent_bigram, that takes in a string and returns the
# two adjacent letters that appear the most in the string.
def most_frequent_bigram(str)
  bigram_counter = Hash.new(0)
  (0...str.length-1).each do |i|
    bigram_counter[str[i] + str[i+1]] += 1
  end
  #p bigram_counter
  highest_count = 0
  most_common_bigram = ""
  bigram_counter.each do |bigram , count|
    if count > highest_count
      highest_count = count
      most_common_bigram = bigram
    end
  end
  return most_common_bigram
  #Test cases do not include bigrams which
  #tie for top frequency, so code does not
  #account for this possibility
end

p most_frequent_bigram("thethrillofit")

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value
  # pairs are swapped
  def inverse
    inverted_hash = {}
    self.each do |key , value|
      inverted_hash[value] = key
    end
    return inverted_hash
  end
end


class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns
  # the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    counter = 0
    self.each_with_index do |ele_1 , i_1|
      self.each_with_index do |ele_2 , i_2|
        if i_1 < i_2 && ele_1 + ele_2 == num
          counter += 1
        end
      end
    end
    return counter
  end


  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort commonly accept a block. That block
  # accepts two parameters, which represents the two elements in the array being
  # compared. If the block returns 1, it means that the second element passed to
  # the block should go before the first (i.e., switch the elements). If the
  # block returns -1, it means the first element passed to the block should go
  # before the second (i.e., do not switch them). If the block returns 0 it
  # implies that it does not matter which element goes first (i.e., do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)
    
  end
end