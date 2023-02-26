# 年齢から成年か未成年かを判断するメソッド
def type (age)
  if age < 0
    # ageがマイナス値のときは例外を発生させる
    raise "年齢がマイナスです (#{age}才)"
  elsif age < 20
    "未成年"
  else
    "成年"
  end
end

begin
# コマンドラインの引数を整数に変換して変数ageに格納する
  age = ARGV.first.to_i
  puts "#{age}才は#{type(age)}です"
rescue => e
  # 例外が発生した時に実行する処理
  puts "例外が発生しました: #{e.message}"
ensure
  # 例外の発生有無にかかわらず実行される処理
  puts "ご利用ありがとうございました"
end
