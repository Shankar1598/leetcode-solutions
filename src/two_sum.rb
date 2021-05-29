# https://leetcode.com/problems/two-sum/

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  positions = {}
  nums.each_with_index do |num, index|
    compliment = target - num
    if positions[compliment]
      return [positions[compliment], index]
    else
      positions[num] = index
    end
  end
end
