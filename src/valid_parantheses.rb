# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.

# Example 1:

# Input: s = "()"
# Output: true
# Example 2:

# Input: s = "()[]{}"
# Output: true
# Example 3:

# Input: s = "(]"
# Output: false
# Example 4:

# Input: s = "([)]"
# Output: false
# Example 5:

# Input: s = "{[]}"
# Output: true


# Constraints:

# 1 <= s.length <= 104
# s consists of parentheses only '()[]{}'

# Difficulty: Easy (This one should be super easy IMO)

# Result:
# Runtime: 116 ms, faster than 5.35% of Ruby online submissions for Valid Parentheses.
# Memory Usage: 210.3 MB, less than 25.67% of Ruby online submissions for Valid Parentheses.


OPENING_PAIR = {
  ')' => '(',
  ']' => '[',
  '}' => '{',
}
def is_valid string
  stack = []
  string.split("").each do |char|
    if OPENING_PAIR.values.include?(char)
      stack << char
      next
    end
    if stack.pop != OPENING_PAIR[char]
      return false
    end
  end
  stack.empty?
end


puts is_valid('()')
# true
puts is_valid('()[]{}')
# true
puts is_valid('(]')
# false
puts is_valid('([)]')
# false
puts is_valid('{[]}')
# true
