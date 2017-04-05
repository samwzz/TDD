require 'byebug'

def stock_picker(array)
  days = []
  highest = nil

  array.each_with_index do |buy_price, i|
    (i + 1..array.length - 1).each do |j|
      sell_price = array[j]
      profit = sell_price - buy_price
      if highest.nil? || profit > highest
        days = [i + 1, j + 1]
        highest = profit
      end
    end
  end
  days
end
