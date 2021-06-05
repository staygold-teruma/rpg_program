# モンスター抽選メソッド
def draw_monster(monster_random)
  case monster_random
  when 1,2
    {name:"バラモス", hp:180, offence:45, defence:45, speed:15, point:50, lv:1}
  when 3..5
    {name:"メタルスライム", hp:5, offence:33, defence:130, speed:30, point:100, lv:1}
  when 6..10
    {name:"キメラ", hp:45, offence:35, defence:30, speed:25, point:20, lv:1}
  when 11..15
    {name:"ゴーレム", hp:80, offence:40, defence:40, speed:10, point:30, lv:1}
  when 16..20
    {name:"スライム", hp:25, offence:32, defence:35, speed:15, point:10, lv:1}
  end
end

# 残りHP表示
def info_condition(brave, monster)
  puts <<~TEXT
  *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
  【#{brave.name}】HP:#{brave.hp}
  【#{monster.name}】HP:#{monster.hp}
  *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
  TEXT
end

# 戦闘
def battle(brave, monster)
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
    info_condition(brave, monster) 
  end
end
