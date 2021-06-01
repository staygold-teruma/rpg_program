require './character.rb'

class Brave < Character
  def attack_from_brave(monster)
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

    # 勇者が倒した場合
    if monster.hp <= 0
      # HPを0以下にしない処理
      monster.hp = 0
      puts "#{monster.name}を倒した!"
      puts "#{@name}は#{monster.point}の経験値を手に入れた"
      @point += monster.point
      case @point
        when 10..20
          puts "#{@name}はレベルが1上がった!"
        when 21..50
          puts "#{@name}はレベルが2上がった!"
        when 51..100
          puts "#{@name}はレベルが3上がった!"
      end
    # 戦闘継続の場合
    else
      puts "#{monster.name}の残りHPは#{monster.hp}だ"  
    end     
  end
end