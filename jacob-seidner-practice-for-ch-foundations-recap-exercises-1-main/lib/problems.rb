# Write a method, all_vowel_pairs, that takes in an array of words and returns
# all pairs of words that contain every vowel. Vowels are the letters a, e, i,
# o, u. A pair should have its two words in the same order as the original
# array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  #pairs_with_duplicates = []
  pairs = []
  words.each do |word_1|
    words.each do |word_2|
      if word_1.include?("a") || word_2.include?("a")
        if word_1.include?("e") || word_2.include?("e")
          if word_1.include?("i") || word_2.include?("i")
            if word_1.include?("o") || word_2.include?("o")
              if word_1.include?("u") || word_2.include?("u")
                if !pairs.include?(word_2 + " " + word_1)
                  pairs << (word_1 + " " + word_2)
                end
              end
            end
          end
        end
      end
      #Lines 14 through 19 and could be condensed 21 through 26 could
      #be condensed into single lines using && operators saving
      #vertical space at the cost of an incredibly wide line 14
    end
  end
  #pairs_with_duplicates.each_with_index do |pair, i|
    #if i < (pairs_with_duplicates.length / 2)
      #pairs << pair
    #end
  #end
  #^This was originally intended to, and failed to,
  #accomplish the functioanlity now on line 19.
  return pairs
end
p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]

# Write a method, composite?, that takes in a number and returns a boolean
# indicating if the number has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true composite?(13)    # => false
def composite?(num)
  (2...num).each do |i|
    if num % i == 0
      return true
    end
  end
  return false
end

p composite?(9)     # => true
p composite?(13)    # => false

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the order of their appearance in the
# original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  included_bigrams = []
  bigrams.each do |bigram|
    if str.include?(bigram)
      included_bigrams << bigram
    end
  end
  return included_bigrams
end

p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
p find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]

# Write a method, Hash#my_select, that takes in an optional proc argument
# The method should return a new hash containing the key-value pairs that return
# true when passed into the proc.
# If no proc is given, then return a new hash containing the pairs where the key
# is equal to the value.
#
# Examples:
#
# hash_1 = {x: 7, y: 1, z: 8}
# hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
#
# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# hash_2.my_select                            # => {4=>4}
class Hash
  @@output_hashes = []
  def my_select(&prc)
    #method_call = proc ?
    new_hash = Hash.new
    self.each do |k , v|
      if prc == nil && k == v || prc != nil && prc.call(k, v)
        new_hash[k] = v
      end
    end
    @@output_hashes << new_hash
    #@@output_hashes[method_call] = new_hash
    p @@output_hashes
    #^Testing class functionality
    return new_hash
  end
end

 hash_1 = {x: 7, y: 1, z: 8}
p hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
#
 hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
p hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
p hash_2.my_select                            # => {4=>4}

# Write a method, String#substrings, that takes in a(n) optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.
#
# Examples:
#
# "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# "cats".substrings(2)  # => ["ca", "at", "ts"]
class String
  def substrings(length = nil)
    array_of_substrings = []
    substrings_of_specified_length = []
    (0...self.length).each do |i|
      (0...self.length).each do |j|
        if i <= j
          array_of_substrings << self[i..j]
        end
      end
    end
    if length == nil
      return array_of_substrings
    end
    array_of_substrings.each do |substring|
      if substring.length == length
        substrings_of_specified_length << substring
      end
    end
    return substrings_of_specified_length 
  end
end

p "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
p "cats".substrings(2)  # => ["ca", "at", "ts"]

# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string
# is shifted the given number of times in the alphabet.
#
# Examples:
#
# "apple".caesar_cipher(1)    #=> "bqqmf"
# "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# "zebra".caesar_cipher(4)    #=> "difve"
class String
  def caesar_cipher(num)
    cipher = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz" * 2
    self.each_char do |char|
        if alphabet.include?(char)
            cipher += alphabet[alphabet.index(char) + (num % 26)]
        else
            cipher += char
        end
    end
    return cipher
  end
end

p "apple".caesar_cipher(1)    #=> "bqqmf"
p "bootcamp".caesar_cipher(2) #=> "dqqvecor"
p "zebra".caesar_cipher(4)    #=> "difve"
#Jacob Seidner