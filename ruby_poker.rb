# カード取得
card_array = ['H5', 'H13', 'D13', 'S13', 'C5']

# 絵柄だけ切り取った配列を作成
suit_array = card_array.map{|card| card.slice(/[A-Z]+/)}
# 絵柄の枚数でグループ分けする
# 下記のgroup_byは`group_by(&:itself)`のようにもかけます
suit_group = suit_array.group_by{|suit| suit}

# 数だけ切り取った配列を作成
number_array = card_array.map{|card| card.slice(/[0-9]+/)}
# あとから判定するために並べ替えておく
sort_number = number_array.sort{|a,b| a.to_i <=> b.to_i}
# 数の枚数でグループ分けする
# 上記にもあったように`group_by{|number| number}`でも同じです
number_group = sort_number.group_by(&:itself)

# フラッシュ判定ロジック
def check_flush? suit
  # 絵柄が1つの種類のみなので要素は1つ
  suit.length == 1 # この条件を見てtrue or falseを返す
end

# ストレート判定ロジック
def check_straight? number
  # 重複はしないはず=>数の種類は5枚なので要素が5つ以外ならfalseを返す
  return false if number.length != 5

  # 数自体を見ていくのでhashの中から数だけを取得
  number_keys = number.keys
  # 文字列(string)になっているのでを数値(integer)に変更
  number_order = number_keys.map do |number|
    number.to_i
  end

  # 例えば`[4,5,6,7,8]`のように、前後の数値同士の差が1になるはずなのでチェック
  # 注意：13と1は連番扱いなので先にチェック
  return true if number_order == [1, 10, 11, 12, 13]

  # `[[4,5],[5,6],[6,7],[7,8]]`のようにチェックし合う数の配列を作成
  number_combination = number_order.each_cons(2)
  # 差が1かどうかチェック
  if number_combination.find{|a| (a[0] - a[1]).abs != 1}
    false
  else
    true
  end
end

# 重複している数のパターンで役を判定するため、重複している数の配列を作成
# 例
# {"5"=>["5", "5"], "13"=>["13", "13", "13"]}
# 5が2つ重複、13が3つ重複なので[2,3]を作成する
def check_pair number
  # hashのvalueを取得する
  number_values = number.values
  # 要素の数の配列を作成
  number_value_count = number_values.map do |number|
    number.count
  end
  # 昇順に並べ替え
  number_value_count.sort
end

# 判定
if number_group.length == 2
  puts "フォーカード" if check_pair(number_group) == [1,4]
  puts "フルハウス" if check_pair(number_group) == [2,3]
elsif number_group.length == 3
  puts "スリーカード" if check_pair(number_group) == [1,1,3]
  puts "ツーペア" if check_pair(number_group) == [1,2,2]
elsif number_group.length == 4
  puts "ワンペア"
else
  puts "ストレートフラッシュ" if check_flush?(suit_group) && check_straight?(number_group)
  puts "フラッシュ" if check_flush? suit_group
  puts "ストレート" if check_straight? number_group
  puts "ノーペア"
end
