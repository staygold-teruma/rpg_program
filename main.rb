# ファイル読み込み
require './brave.rb'
require './monster.rb'
require './method.rb'


# 実行部分----------------------------------------------------------------------------

# 勇者生成
brave_params = {name:"勇者", hp:150, offence:45, defence:30, speed:20, point:0, lv:1}
brave = Brave.new(brave_params)

# ボス(バラモス)を倒すか、勇者が負けるまで、戦闘&成長を繰り返す
loop {
  monster_random_num = rand(1..20)

  # モンスター生成
  choosen_monster = draw_monster(monster_random_num)
  monster = Monster.new(choosen_monster)

  # モンスター出現
  monster.appear

  # 戦闘
  battle(brave, monster)

  # 結果表示
  monster.hp <= 0 ? brave.info_win_result(monster) : brave.info_lose_result
  puts "戦闘は終了した"
  
  # 勇者レベルアップ判定
  brave.level_up
  
  # 勇者パラメーター確認用
  puts <<~TEXT
  *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
  【#{brave.name}の成長】
  レベル:#{brave.lv}
  HP:#{brave.hp}
  攻撃:#{brave.offence}
  防御:#{brave.defence}
  素早さ:#{brave.speed}
  経験値:#{brave.point}
  *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
  TEXT
  
  # バラモスを倒した時点で終了
  if monster.name == "バラモス" && monster.hp <= 0
    break
  end
}

puts "勇者の活躍で世界に平和が訪れた"