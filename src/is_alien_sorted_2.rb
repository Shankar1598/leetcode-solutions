# Better than my previous attempt 1.5 years ago
# Runtime: 86ms, beats: 100%

# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  order_hash = {}
  order.each_char.with_index do |char, index|
    order_hash[char] = index
  end
  words_count = words.length
  (words_count - 1).times do |index|
    word1 = words[index]
    word2 = words[index + 1]
    max_length = [word1.size, word2.size].max
    puts "word1: #{word1}, word2: #{word2}, max_length: #{max_length}"
    max_length.times do |curser|
      if word1[curser] && word2[curser]
        # Both words are present
        if order_hash[word1[curser]] > order_hash[word2[curser]]
          # 1st char is bigger. FAIL.
          return false
        elsif order_hash[word1[curser]] == order_hash[word2[curser]]
          # Same, skip
          next
        else
          # 1st char is smaller. Pass.
          break
        end
      elsif word1[curser] && !word2[curser]
        # 2nd word is not present. IE, second word is shorter than the 1st word.
        # If the words are identical so far, then the shortest one comes first
        # FAIL
        return false
      else
        # 1st word is shorter, and the words are identical so far. Pass.
        break
      end
    end
  end

  return true
end

puts is_alien_sorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")
puts is_alien_sorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")


["shankar", "shampoo"]
