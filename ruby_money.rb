money = 6498
money_types = [10000, 5000, 1000, 500, 100, 50, 10, 5, 1]
result = []
total = 0

money_types.each do |type|
  amount = (money - total) / type
  total += amount * type
  result.push([type, amount])
end

result = result.reverse.to_h

p result
