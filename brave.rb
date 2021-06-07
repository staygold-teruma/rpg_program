require './character.rb'

class Brave < Character
  # 勇者勝利時の結果表示
  def info_win_result(monster)
    puts "#{monster.name}を倒した!"
    puts "#{@name}は#{monster.point}の経験値を手に入れた"

    # 経験値付与
    @point += monster.point
  end

  # 勇者敗北時の結果表示
  def info_lose_result_and_exit
    puts "#{@name}は力尽きた…"
    exit
  end

  # 勇者のレベルアップ
  def level_up
    # 経験値に応じたレベルの設定
    get_new_level
    # レベルアップ時のみ表示
    puts "#{@name}はレベルが#{@new_level}にあがった!" if @new_level > @lv

    # 各パラメーターの成長（privateメソッド）
    grow_parameter

  end

  # privateメソッド
  private
  
  def get_new_level
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
  end
  
  def grow_parameter
    # レベルアップする回数
    level_up_num = @new_level - @lv
    # @hpの戦闘による増減に影響されない各レベルの最大HPを定義
    @max_hp = 150 + 5 * (@lv - 1)
    # レベルアップ処理（下記、成長モデルに沿って）
    # レベルアップした回数分を繰り返す
    level_up_num.times do
      # lvとhpは毎回UPする
      @lv += 1
      @max_hp += 5
      
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

    # レベルアップ後はHPが最大まで回復する仕様
    @hp = @max_hp
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


