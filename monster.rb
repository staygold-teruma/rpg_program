require './character.rb'
class Monster < Character

  # モンスター生成
  def self.create_monster
    # モンスター乱数
    monster_random_num = rand(1..20)

    # モンスター生成
    choosen_monster = 
    case monster_random_num
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

    monster = Monster.new(choosen_monster)
  end

end

# メモ-------------------------------------------------------
# ■クラスメソッド
# self.メソッド名で作成
# 使用するにはクラス名.メソッド名

# ■インスタンスメソッド
# クラスにメソッドを作成するとそれがインスタンスメソッドとなる。特に追加で記述する必要はない
# インスタンスメソッドを使用するにはインスタンスを作成(.new)しなければならない