# それぞれのrankを設定しました。ローカルで試す場合はリストの中身をいじってみてください。
@fire_danger_rank, @building_collapse_rank, @active_difficulty_rank = [2, 2, 1]
# ３つのランクをリスト化
danger_list = [ @fire_danger_rank, @building_collapse_rank, @active_difficulty_rank]

# 一番高い数値の重複する個数を確認
def equal_count(list)
  # listの中身を高順に書き換え
  list.sort! {|x,y| y<=>x}
  # 重複する個数としてcountを設定。初期値は１。
  count = 1
  pointed_at = 0
  # それぞれ高い数値の重複を確認、一致がなかったらループ処理をbreakする。
  (list.length - 1).times do
    if list[pointed_at] == list[pointed_at + 1]
      count += 1
    else
      break
    end
    pointed_at += 1
  end
	# 最終的に重複する個数を返す。
  return count
end

# rankが高いtypeを割り出す
priority_list = [['fire', @fire_danger_rank], ['building', @building_collapse_rank], ['active', @active_difficulty_rank]]
def priority_rank(list, count)
	# 入力するpriority＿listのrankを比較し、降順に並び替える
  list.sort! { |x,y| y[1]<=>x[1] }
	# 最終的に高いrankのtypeを格納する空listを用意。
  priority_disaster = []
	# 降順にしたリストのうち、count番目までを切りとり、分類を空listに格納する。
  list.first(count).each do |n|
    priority_disaster << n[0]
  end
	# 格納したlistを最終的には返す。
  return priority_disaster
end
# 高ランクで重複する個数をpriority_countに代入
priority_count = equal_count(danger_list)

# 高ランクの災害種別をpriority_ranksに代入（array型）
priority_ranks = priority_rank(priority_list, priority_count)

# 場合分けして@types_idに代入
@types_id =
if priority_count == 1 && priority_ranks == ['fire']
  1
elsif priority_count == 1 && priority_ranks == ['building']
  2
elsif priority_count == 1 && priority_ranks == ['active']
  3
elsif priority_count == 2 && priority_ranks.sort == ['building', 'fire'].sort
  4
elsif priority_count == 2 && priority_ranks.sort == ['active', 'fire'].sort
  5
elsif priority_count == 2 && priority_ranks.sort == ['active', 'building'].sort
  6
elsif priority_count == 3
  7
end

# 実行したらターミナルで「4」と表示されるはず。（１行目の設定では）
p @types_id
