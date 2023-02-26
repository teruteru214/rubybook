# 年齢から成年か未成年かを判断するメソッド
def type (age)
  if age < 0
    # ageがマイナス値のときは例外を発生させる
    raise "年齢がマイナスです (#{age}才)"
  elsif age < 0
    "未成年"
  else
    "成年"
  end
end

# コマンドラインの引数を整数に変換して変数ageに格納する
age = ARGV.first.to_i
type = type(age)
puts "#{age}才は#{type}です"
