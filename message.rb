module Message
  class << self
    # モンスター出現表示
    def monster_appear(monster)
      puts <<~TEXT
      *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
      【#{monster.name}】が現れた!!
      *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
      TEXT
    end

    # 勇者・モンスターの残りHP表示
    def condition(brave, monster)
      puts <<~TEXT
      *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
      【#{brave.name}】HP:#{brave.hp}
      【#{monster.name}】HP:#{monster.hp}
      *=*=*=*=*=*=*=*=*=*=*=*=*=*=*
      TEXT
    end

    # 勇者の成長表示
    def brave_growth(brave)
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

  end
  
end

# メモ-------------------------------------------------------
# ファイル名はModule名をスネークケースで！
# Moduleもクラスメソッドを定義できる

# 特異クラス形式
# class << self  
# 特異クラス方式では、class << self と書いた行から end までの間に 
# def class_method のようにクラス名を書かずにインスタンスメソッドと同じようなメソッド定義を書く。
# この間に書いたものはクラスメソッドとして定義される。