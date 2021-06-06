module Calc
  class << self
    # 攻撃処理
    def attack(character1, character2)
      # 攻撃を計算
      # 攻撃が1未満になる場合は1を代入する（ダメージを1にする）
      if (character1.offence - character2.defence / 2 ) < 1
        damage = 1
      else
        damage = ( character1.offence - character2.defence / 2 ).round(0)
      end

      puts "#{character1.name}の攻撃"
      puts "#{character2.name}に#{damage}のダメージを与えた" 

      # HPを減らす処理
      character2.hp -= damage
      character2.hp = 0 if character2.hp <= 0
    end
  end



end
