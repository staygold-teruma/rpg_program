require "./messages.rb"

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
    Message.info_condition(brave, monster)
  end
end
