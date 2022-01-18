require_relative 'character'

class Enemy < Character
  POWER_UP_RATE = 1.5
  CALC_HALF_HP  = 0.5

  def initialize(**params)
    @name    = params[:name]
    @hp      = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]

    @transform_flag = false
    @trigger_of_transform = params[:hp] * CALC_HALF_HP
  end

  def attack(player)
    if @hp <= @trigger_of_transform && @transform_flag == false
      @transform_flag = true
      transform
    end

    puts "#{@name}の攻撃"

    damage = calculate_damage(player)
    cause_damage(target: player, damage: damage)

    puts "#{player.name}の残りHPは#{player.hp}だ"
  end

  private

  def calculate_damage(target)
    @offense - target.defense
  end

  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]

    target.hp -= damage
    target.hp = 0 if target.hp < 0
    puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def transform
    transform_name = "悪魔大王"
    puts "#{@name}は激怒した"
    puts "#{@name}は#{transform_name}に変身した"
    
    @offense *= POWER_UP_RATE
    @name = transform_name
  end
end
