$symbol_value = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
}
def roman_to_int(roman_str)
    final_value = 0
    roman_str.each_char.with_index do |char, index|
		next_value = $symbol_value[roman_str[index + 1]]
		this_value = $symbol_value[char]
		if next_value && next_value > this_value
			final_value -= this_value
		else
			final_value += this_value
		end
		# if index > 0
		# 	previous_value = $symbol_value[roman_str[index - 1]]
		# 	if this_value > previous_value
		# 		final_value -= (previous_value * 2)
		# 	end
		# end
    end
	final_value
end
puts roman_to_int("VI")
puts roman_to_int("V")
puts roman_to_int("IV")
puts roman_to_int("LVIII")
