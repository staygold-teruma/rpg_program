# ファイル読み込み
require './brave.rb'
require './monster.rb'
require './method.rb'

# 勇者
brave_params = [ {name:"勇者", hp:150, offence:45, defence:30, speed:20, point:0, lv:1},
  {name:"勇者", hp:155, offence:45, defence:35, speed:20, point:0, lv:2},
  {name:"勇者", hp:160, offence:50, defence:35, speed:25, point:0, lv:3},
  {name:"勇者", hp:165, offence:55, defence:40, speed:20, point:0, lv:4},
  {name:"勇者", hp:170, offence:60, defence:40, speed:30, point:0, lv:5}
]



# ******実行部分******

# モンスター抽選乱数
monster_random = rand(1..20)

# 勇者・モンスターの生成
brave = Brave.new(brave_params[0])
choosen_monster = draw_monster(monster_random)
monster = Monster.new(choosen_monster)

# モンスター出現
monster.appear

# 戦闘1回目
battle(brave, monster)

# 結果表示
monster.hp <= 0 ? brave.info_win_result(monster) : brave.info_lose_result
puts "戦闘は終了した"


# 課題外の余分な遊び----------------------------------------------------------
# うまくレベルアップすることでバラモスを倒せるかも

# 獲得した経験値から成長後の勇者を生成
# レベルが同じハッシュを取得
improved_brave = brave_params.find{|x| x[:lv] == brave.lv}
# 経験値を書き換え
improved_brave[:point] = brave.point
brave = Brave.new(improved_brave)

# モンスター生成
monster_random = rand(1..20)
choosen_monster = draw_monster(monster_random)
monster = Monster.new(choosen_monster)
monster.appear

# 戦闘2回目
battle(brave, monster)

monster.hp <= 0 ? brave.info_win_result(monster) : brave.info_lose_result
puts "戦闘は終了した"
