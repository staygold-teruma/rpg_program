# ファイル読み込み
require './brave.rb'
require './monster.rb'
require './methods.rb'
require './messages.rb'



# 実行部分----------------------------------------------------------------------------

# 勇者生成
brave_params = {name:"勇者", hp:150, offence:45, defence:30, speed:20, point:0, lv:1}
brave = Brave.new(brave_params)

# # ボス(バラモス)を倒すか、勇者が負けるまで、戦闘&成長を繰り返す
loop do
  monster = Monster.create_monster
  Message.info_monster_appear(monster)

  # 戦闘
  battle(brave, monster)

  # 結果表示
  monster.hp <= 0 ? brave.info_win_result(monster) : brave.info_lose_result_and_exit
  
  # 勇者レベルアップ
  brave.level_up
  
  # 勇者パラメーター確認用
  Message.info_brave_growth(brave)
  
  # バラモスを倒した時点で終了
  break if monster.name == "バラモス" 
end

puts "勇者の活躍で世界に平和が訪れた"