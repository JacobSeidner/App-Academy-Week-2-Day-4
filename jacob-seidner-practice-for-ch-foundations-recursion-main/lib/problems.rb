# Write a method, pow(base, exponent), that takes in two numbers.
# The method should calculate the base raised to the exponent power.
# You can assume the exponent is always positive.
#
# Solve this recursively!
#
def pow(base, exponent)
  if exponent == 0
    return 1
  end
  base * pow(base, (exponent - 1))
end

# Examples:
p pow(2, 0) # => 1
p pow(2, 1) # => 2
p pow(2, 5) # => 32
p pow(3, 4) # => 81
p pow(4, 3) # => 64
puts "----"

# Write a method, lucas_number(n), that takes in a number.
# The method should return the n-th number of the Lucas Sequence.
# The 0-th number of the Lucas Sequence is 2.
# The 1-st number of the Lucas Sequence is 1
# To generate the next number of the sequence, you add up the previous two 
# numbers.
#
# For example, the sequence begins: 2, 1, 3, 4, 7, 11, ...
#
# Solve this recursively!
#
def lucas_number(n)
    if n == 0
        return 2
    elsif n == 1
        return 1
    end
    lucas_number(n - 1) + lucas_number(n - 2)
end

# Examples:
p lucas_number(0)   # =>    2
p lucas_number(1)   # =>    1
p lucas_number(2)   # =>    3
p lucas_number(3)   # =>    4
p lucas_number(5)   # =>    11
p lucas_number(9)   # =>    76
puts "----"


# Write a method, sum_array(array), that takes in an array of numbers.
# The method should return the total sum of the elements.
# 
# Solve this recursively!
#
def sum_array(array)
  if array.length == 0
    return 0
  end
  array.pop + sum_array(array)
end

# Examples:
p sum_array([])             # => 0
#^I don't think that's true, but I made the base case an empty array to accomodate this example.
p sum_array([5])            # => 5
p sum_array([5, 2])         # => 7
p sum_array([4, 10, -1, 2]) # => 15
puts "----"

# Write a method, reverse_string(str), that takes in a string.
# The method should return the string with its characters in reverse order.
#
# Solve this recursively!
#
def reverse_string(str)
    if str.length == 0
        return ""
    end
    str[str.length - 1] + reverse_string(str[0...str.length-1])
end

# Examples:
p reverse_string("")            # => ""
p reverse_string("c")           # => "c"
p reverse_string("internet")    # => "tenretni"
p reverse_string("friends")     # => "sdneirf"
puts "----"


# A 1-dimensional array is also known as a flattened array.
# Write a method, flatten(data), that accepts a single argument. The
# method should take in an array of any dimension and return the flattened
# version of that array. Solve this recursively.
#   
# Hint:
#  - if the argument is not an array, then you have reached the base case
#  - look up the documentation for how to check if data is an array or not
#
# Examples:
#
def flatten(data)
    if !data.kind_of?(Array)
        return [data]
    end
    #^Base Case #1
    data_is_one_dimensional = true
    data.each do |ele|
        if ele.kind_of?(Array)
            data_is_one_dimensional = false
        end
    end
    if data_is_one_dimensional
        return data
    end
    #^Base Case #2
    #Unfortunatey I cannot test for both base cases at the same time
    #because the .each call used to determine whether "data" is one dimensional
    #only works when data is not already 0 dimensional.
    data_with_one_less_dimension = []
    data.each do |ele|
        if !ele.kind_of?(Array)
            data_with_one_less_dimension << ele
        else
            ele.each do |sub_ele|
                data_with_one_less_dimension << sub_ele
            end
        end
    end
    p data_with_one_less_dimension
    flatten(data_with_one_less_dimension)
end

array_1 = [1, 2, [[3, 4], [5, [6]]], [7, 8]]
p flatten(array_1)      # => [ 1, 2, 3, 4, 5, 6, 7, 8 ]
#
p array_2 = ['this', ['problem', 'is'], [['pretty', 'tough'], [[':)']]]]
flatten(array_2)      # => [ 'this', 'problem', 'is', 'pretty', 'tough', ':)' ]
#
p flatten('base case')  # => [ 'base case' ]
puts "----"

# Another Hint:
#
# That last example might be confusing because it passes in a string instead of
# an array. If data is not an array, then you can consider it as a 0-dimensional
# array.
#
#     0-dimensional array: 'some data'
#     1-dimensional array: ['some data']
#     2-dimensional array: [['some data']]
#     3-dimensional array: [[['some data']]]

#11 Examples 0 Failures
#Jacob Seidner