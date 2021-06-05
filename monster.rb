require './character.rb'
class Monster < Character
  # モンスター出現
  def appear 
    puts <<~TEXT
    *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    【#{@name}】が現れた!!
    *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    TEXT
  end
  
  # モンスターの攻撃処理
  def attack(brave)
    # 攻撃を計算
    # 攻撃が1未満になる場合は1を代入する（ダメージを1にする）
    if (@offence - brave.defence / 2 ) < 1
      monster_attack = 1
    else
      monster_attack = ( @offence - brave.defence / 2 ).round(0)
    end
    
    puts "#{@name}の攻撃"
    puts "#{brave.name}は#{monster_attack}のダメージを受けた" 

    # HPを減らす処理
    brave.hp -= monster_attack
    brave.hp = 0 if brave.hp <= 0
  end

end