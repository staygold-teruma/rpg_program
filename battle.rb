module Battle
  class << self
    # 戦闘
    def repeat_turn(brave, monster)
      while brave.hp > 0 && monster.hp > 0
        # 勇者の方が早い場合
        if brave.speed > monster.speed
          #勇者が攻撃
          Battle.attack(brave, monster)
          # モンスター生存時、モンスター攻撃
          Battle.attack(monster, brave) if monster.hp > 0

          # モンスターの方が早い場合
        else
          # モンスターの攻撃
          Battle.attack(monster, brave)
          # 勇者生存時、勇者攻撃
          Battle.attack(brave, monster) if brave.hp > 0
        end

        # 勇者もモンスターも生存時、残りHP表示
        Message.condition(brave, monster)
      end
    end

    # 攻撃処理
    def attack(attaker, target)
      # 攻撃を計算
      # 攻撃が1未満になる場合は1を代入する（ダメージを1にする）
      if (attaker.offence - target.defence / 2 ) < 1
        damage = 1
      else
        damage = ( attaker.offence - target.defence / 2 ).round(0)
      end

      puts "#{attaker.name}の攻撃"
      puts "#{target.name}に#{damage}のダメージを与えた" 

      # HPを減らす処理
      target.hp -= damage
      target.hp = 0 if target.hp <= 0
    end

  end
end
