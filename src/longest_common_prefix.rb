def longest_common_prefix(strs)
    shortest_length = strs.map {|str| str.size }.min
    prefix = ""
    shortest_length.times do |index|
        char_to_match = nil
        matched = strs.all? do |str|
            char_to_match ||= str[index]
            (char_to_match == str[index])
        end
        if matched
            prefix << char_to_match
        else
          return prefix
        end
    end
    prefix
end
puts longest_common_prefix(["cir","car"])
