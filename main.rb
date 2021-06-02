# ファイル読み込み
require './brave.rb'
require './monster.rb'

# 勇者
brave = {name:"勇者", hp:150, offence:45, defence:30, speed:20, point:0}

# モンスター抽選
# 乱数生成
monster_random = rand(1..20)
# モンスター抽選ボックス
monster =
case monster_random
  when 1..3
    {name:"バラモス", hp:160, offence:45, defence:45, speed:15, point:50}
  when 4..5
    {name:"メタルスライム", hp:5, offence:33, defence:100, speed:30, point:100}
  when 6..10
    {name:"キメラ", hp:45, offence:35, defence:30, speed:25, point:20}
  when 11..15
    {name:"ゴーレム", hp:80, offence:40, defence:40, speed:10, point:30}
  when 16..20
    {name:"スライム", hp:25, offence:32, defence:35, speed:15, point:10}
end
# case文は最後に評価した値を返してくれる
# これをmonsterに代入することで、処理をまとめることが可能

# 勇者・モンスターの生成
brave = Brave.new(brave)
monster = Monster.new(monster)

# モンスター出現
monster.appear

# 残りHP表示
def info_condition(brave, monster)
  puts "#{monster.name}の残りHPは#{monster.hp}だ"  
  puts <<~TEXT
  *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
  【#{brave.name}】HP:#{brave.hp}
  【#{monster.name}】HP:#{monster.hp}
  *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
  TEXT
end

# 戦闘開始
while brave.hp > 0 && monster.hp > 0
  # 勇者の方が早い場合
  if brave.speed > monster.speed
    #勇者が攻撃
    brave.attack(monster)
    # モンスター生存時、モンスター攻撃
      monster.attack(brave) if monster.hp > 0

  # モンスターの方が早い場合
  else
    # モンスターの攻撃
    monster.attack(brave)
    # 勇者生存時、勇者攻撃
      brave.attack(monster) if brave.hp > 0
  end 

  # 勇者もモンスターも生存時、残りHP表示
  info_condition(brave, monster) if brave.hp > 0 && monster.hp > 0

end
# whileに条件式があるので、指定の条件から外れると自動的にループを抜けられる
# if修飾子や三項演算子を用いて、コードを簡潔に！
# 「真(true)」時の処理 if 条件式
# 条件式 ? 「真(true)」時の処理 : 「偽(false)」時の処理

monster.hp <= 0 ? brave.info_result(monster) : monster.info_result(brave)
puts "戦闘は終了した"