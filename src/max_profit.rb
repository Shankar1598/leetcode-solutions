# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

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
