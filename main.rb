# ファイル読み込み
require './brave.rb'
require './monster.rb'

# 勇者
params1 = {name:"勇者", hp:150, offence:45, defence:30, speed:20, point:0}

# モンスター抽選
# 乱数生成
monster_random = rand(1..20)
# モンスター抽選ボックス
case monster_random
  when 1..3
    params2 = {name:"バラモス", hp:160, offence:45, defence:45, speed:15, point:50}
  when 4..5
    params2 = {name:"メタルスライム", hp:5, offence:33, defence:100, speed:30, point:100}
  when 6..10
    params2 = {name:"キメラ", hp:45, offence:35, defence:30, speed:25, point:20}
  when 11..15
    params2 = {name:"ゴーレム", hp:80, offence:40, defence:40, speed:10, point:30}
  when 16..20
    params2 = {name:"スライム", hp:25, offence:32, defence:35, speed:15, point:10}
end

# 勇者・モンスターの生成
brave = Brave.new(params1)
monster = Monster.new(params2)

# モンスター出現
monster.appear

# 残りHP表示
def each_condition(brave, monster)
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
    brave.attack_from_brave(monster)
    # モンスターが生きていれば
    if monster.hp > 0
      monster.attack_from_monster(brave) 
      # 勇者が生きていれば
      if brave.hp > 0
        each_condition(brave, monster)
      end
    else
      break
    end

  # モンスターの方が早い場合
  else
    monster.attack_from_monster(brave)
    # 勇者が生きていれば
    if brave.hp > 0
      brave.attack_from_brave(monster) 
      # モンスターが生きていれば
      if monster.hp > 0
        each_condition(brave, monster)
      end
    else
      break
    end
  end
end
puts "戦闘は終了した"