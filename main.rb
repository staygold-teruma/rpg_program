# 勇者
params1 = {name:"勇者", hp:35, offence:55, defence:30}
# モンスター
params2 = {name:"バラモス", hp:40, offence:45, defence:40}

class Brave
  attr_reader :name, :hp, :defence
  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offence = params[:offence]
    @defence = params[:defence]
  end 

  def attack_from_brave(enemy)
    brave_attack = ( ( @offence - enemy.defence ) / 2 ).floor
    puts "#{@name}の攻撃"
    puts "#{enemy.name}に#{brave_attack}のダメージを与えた" 
    # 質問箇所----------------------------------------------------
    # ローカル変数に代入して表示はできるが、自己代入でHPを減らす処理でエラーが出る
    # putsで各変数に期待する数値は入っていることは確認しました。
    # left_hp = enemy.hp - brave_attack
    enemy.hp -= brave_attack
    puts "#{enemy.name}の残りHPは#{enemy.hp}だ"   # left_hpならうまく表示できる
  end
end

class Enemy
  attr_reader :name, :hp, :defence
  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offence = params[:offence]
    @defence = params[:defence]
  end

  def attack_from_enemy(brave)
    enemy_attack = ( ( @offence - brave.defence ) / 2 ).floor
    puts "#{@name}の攻撃"
    puts "#{brave.name}に#{enemy_attack}のダメージを与えた" 
    brave.hp -= enemy_attack
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end
end

brave = Brave.new(params1)
enemy = Enemy.new(params2)

brave.attack_from_brave(enemy)
enemy.attack_from_enemy(brave)