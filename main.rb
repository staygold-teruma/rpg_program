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
    enemy.hp -= brave_attack
    puts "#{enemy.name}の残りHPは#{enemy.hp}だ"
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

3.times do 
  brave.attack_from_brave(enemy)
  enemy.attack_from_enemy(brave)
end