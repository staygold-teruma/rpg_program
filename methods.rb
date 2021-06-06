require "./message.rb"
require "./calc.rb"

# 戦闘
def battle(brave, monster)
  while brave.hp > 0 && monster.hp > 0
    # 勇者の方が早い場合
    if brave.speed > monster.speed
      #勇者が攻撃
      Calc.attack(brave, monster)
      # モンスター生存時、モンスター攻撃
      Calc.attack(monster, brave) if monster.hp > 0

      # モンスターの方が早い場合
    else
      # モンスターの攻撃
      Calc.attack(monster, brave)
      # 勇者生存時、勇者攻撃
      Calc.attack(brave, monster) if brave.hp > 0
    end

    # 勇者もモンスターも生存時、残りHP表示
    Message.condition(brave, monster)
  end
end
