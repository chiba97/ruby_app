require_relative 'player'
require_relative 'enemy'

player   = Player.new(name: "天使", hp: 500, offense: 150, defense: 100)
enemy    = Enemy.new(name: "悪魔", hp: 250, offense: 200, defense: 100)

loop do
  player.attack(enemy)
  if enemy.hp <= 0
    puts "#{player.name}はたたかいに勝った"
    puts "世界は光を取り戻した"
    break
  end

  enemy.attack(player)
  if player.hp <= 0
    puts "#{player.name}はたたかいに負けてしまった"
    puts "世界は闇にのまれた"
    break
  end
end