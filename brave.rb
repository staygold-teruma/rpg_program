require './character.rb'
class Brave < Character

  # 勇者の攻撃処理
  def attack(monster)
    # 攻撃を計算
    # 攻撃が1未満になる場合は1を代入する（ダメージを1にする）
    if (@offence - monster.defence / 2 ) < 1
      brave_attack = 1
    else
      brave_attack = ( @offence - monster.defence / 2 ).round(0)
    end

    puts "#{@name}の攻撃"
    puts "#{monster.name}に#{brave_attack}のダメージを与えた" 

    # HPを減らす処理
    monster.hp -= brave_attack
    monster.hp = 0 if monster.hp <= 0
  end
  
  # 勇者勝利時の結果
  def info_win_result(monster)
    puts "#{monster.name}を倒した!"
    puts "#{@name}は#{monster.point}の経験値を手に入れた"
    @point += monster.point

    new_level =
    case @point
      when 10..20
        2
      when 21..50
        3
      when 51..100
        4
      when 101..200
        5
    end
  
    puts "#{@name}はレベルが#{new_level}にあがった!" if new_level > @lv
    @lv = new_level
  end

  # 勇者敗北時の結果
  def info_lose_result
    puts "#{@name}は力尽きた…"
    exit
  end
end