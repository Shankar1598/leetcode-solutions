# You are given an array prices where prices[i] is the price of a given stock on the ith day.

# You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

# Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.



# Example 1:

# Input: prices = [7,1,5,3,6,4]
# Output: 5
# Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
# Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
# Example 2:

# Input: prices = [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transactions are done and the max profit = 0.


# Constraints:

# 1 <= prices.length <= 105
# 0 <= prices[i] <= 104

# Difficulty: Easy

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  min_price = nil
  max_profit = 0
  prices.each_with_index do |price_today, index|
    if min_price.nil? or (price_today < min_price)
      min_price = price_today
    elsif (np = price_today - min_price) > max_profit
      max_profit = np
    end
  end
  max_profit
end

def max_profit_inefficient(prices)
  bought_price = prices[0]
  sold_price = prices[0]
  profit = 0
  price_history = {}
  prices.each_with_index do |price_today, index|
    if price_today < bought_price
      bought_price = price_today
      sold_price = 0
    end
    if price_today > sold_price
      sold_price = price_today
    end
    price_history[price_today] = index
    if (price_history[bought_price] < price_history[sold_price]) and (profit < (new_profit = sold_price - bought_price))
      profit = new_profit
    end
  end
  profit
end
