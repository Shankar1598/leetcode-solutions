# In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

# Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.



# Example 1:

# Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
# Output: true
# Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
# Example 2:

# Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
# Output: false
# Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
# Example 3:

# Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
# Output: false
# Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).


# Constraints:

# 1 <= words.length <= 100
# 1 <= words[i].length <= 20
# order.length == 26
# All characters in words[i] and order are English lowercase letters.

# Difficulty: Easy

# Result (need to improve):

# Runtime: 108 ms, faster than 5.13% of Ruby online submissions for Verifying an Alien Dictionary.
# Memory Usage: 210.3 MB, less than 6.67% of Ruby online submissions for Verifying an Alien Dictionary.

def is_alien_sorted words, order
  order_hash = order.split('').each_with_index.reduce({}) do |order_hash, (letter, index)|
    order_hash.merge!({
      letter => index
    })
  end
  order_hash[nil] = -1
  max_length = words.map {|word| word.length }.max
  max_length.times do |index|
    letters = words.collect {|word| word[index] }
    sorted_letters = letters.sort_by {|letter| order_hash[letter] }
    if (sorted_letters == letters)
      if letters.uniq.count.eql?(letters.count)
        return true
      else
        next
      end
    else
      return false
    end
  end
  return true
end

# TODO: Try the 'sort adjacent words' solution

puts is_alien_sorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")
# false
puts is_alien_sorted(["hello","hello"], "abcdefghijklmnopqrstuvwxyz")
# true
puts is_alien_sorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")
# true
puts is_alien_sorted(["fxasxpc","dfbdrifhp","nwzgs","cmwqriv","ebulyfyve","miracx","sxckdwzv","dtijzluhts","wwbmnge","qmjwymmyox"], "zkgwaverfimqxbnctdplsjyohu")
# false
puts is_alien_sorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")
# false
puts is_alien_sorted(["kuvp","q"], "ngxlkthsjuoqcpavbfdermiywz")
# true
