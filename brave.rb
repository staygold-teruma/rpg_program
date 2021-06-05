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
  
  # 勇者勝利時の結果表示
  def info_win_result(monster)
    puts "#{monster.name}を倒した!"
    puts "#{@name}は#{monster.point}の経験値を手に入れた"

    # 経験値付与
    @point += monster.point
    
    # 経験値に応じたレベルの設定
    @new_level =
    case @point
      when 10..30
        2
      when 31..80
        3
      when 81..150
        4
      when 151..300
        5
      when 301..600
        6
      when 601..99999
        7
    end
    
    # レベルアップ時のみ表示
    puts "#{@name}はレベルが#{@new_level}にあがった!" if @new_level > @lv
  end

  # 勇者敗北時の結果表示
  def info_lose_result
    puts "#{@name}は力尽きた…"
    exit
  end

  def level_up
    # レベルアップする回数
    level_up_num = @new_level - @lv
    # 戦闘で減ったHPを初期化
    @hp = 150
    
    # レベルアップ処理（下記、成長モデルに沿って）
    # レベルアップした回数分を繰り返す
    level_up_num.times do
      # lvとhpは毎回UPする
      @lv += 1
      @hp += 5
      
      # offenceは奇数レベル時にUP(LV1の時を除く)
      if ( @lv - 1 ) % 2 == 0 && @lv > 1
        @offence += 5
      # defenceは偶数レベル時にUP
      else
        @defence += 5
      end
      
      # speedは(3n+1)レベル時にUP
      if @lv % 3 == 1 && @lv > 1
        @speed += 5
      end
    end

  end

end

# 勇者の成長モデル
# brave_model = [ 
#   {name:"勇者", hp:150, offence:45, defence:30, speed:20, lv:1},
#   {name:"勇者", hp:155, offence:45, defence:35, speed:20, lv:2},
#   {name:"勇者", hp:160, offence:50, defence:35, speed:20, lv:3},
#   {name:"勇者", hp:165, offence:50, defence:40, speed:25, lv:4},
#   {name:"勇者", hp:170, offence:55, defence:40, speed:25, lv:5},
#   {name:"勇者", hp:175, offence:55, defence:45, speed:25, lv:6}
# ]