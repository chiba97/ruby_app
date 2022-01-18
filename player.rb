require_relative 'character'

class Player < Character
  SPECIAL_ATTACK_CONSTANT = 1.5
  
  def attack(enemy)
    puts "#{@name}の攻撃"

    attack_type = decision_attack_type
    damage = calculate_damage(target: enemy, attack_type: attack_type)
    cause_damage(target: enemy, damage: damage)

    puts "#{enemy.name}の残りHPは#{enemy.hp}だ"
  end

  private

  def decision_attack_type
    attack_num = rand(4)
    if attack_num == 0
      puts "必殺攻撃"
      "special_attack"
    else
      puts "通常攻撃"
    end
  end

  def calculate_damage(**params)
    target = params[:target]
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      calculate_special_attack - target.defense
    else
      @offense - target.defense
    end
  end

  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]

    target.hp -= damage
    target.hp = 0 if target.hp < 0
    puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end
end