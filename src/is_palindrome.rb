# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  # return x == x.to_s.reverse.to_i

  str = x.to_s
  length = str.length
  index = 0
  while(index <= length/2) do
    if str[index] != str[length-index-1]
      return false
    end
    index += 1
  end
  true
end
