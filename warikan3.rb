def warikan(bill, number)
  warikan = bill / number
  puts "一人当たり#{warikan}円です"
rescue ZeroDivisionError
  # ZeroDivisionError例外が発生したらメッセージを表示する.
  puts "おっと、0人では割り勘できません"
end

warikan(100, 0)
warikan(100, 1)
warikan(100, 2)
