module Message
  # モンスター出現表示
  def info_monster_appear(monster)
    puts <<~TEXT
    *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    【#{monster.name}】が現れた!!
    *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    TEXT
  end

  # 勇者・モンスターの残りHP表示
  def info_condition(brave, monster)
    puts <<~TEXT
    *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    【#{brave.name}】HP:#{brave.hp}
    【#{monster.name}】HP:#{monster.hp}
    *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    TEXT
  end

  # 勇者の成長表示
  def info_brave_growth(brave)
    puts <<~TEXT
    *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    【#{brave.name}の成長】
    レベル:#{brave.lv}
    HP:#{brave.hp}
    攻撃:#{brave.offence}
    防御:#{brave.defence}
    素早さ:#{brave.speed}
    経験値:#{brave.point}
    *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    TEXT
  end

  module_function :info_monster_appear
  module_function :info_condition
  module_function :info_brave_growth
  
end
