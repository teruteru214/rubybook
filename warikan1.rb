puts "金額を入力してください"
bill = gets.to_i
puts "割り勘する人数を入力してください"
number = gets.to_i

warikan = bill / number
puts "一人当たり#{warikan}円です。"
