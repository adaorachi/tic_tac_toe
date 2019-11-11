#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative('../lib/player.rb')
require_relative('../lib/board.rb')
require_relative('../lib/game.rb')

game = Game.new

game.sleep_mode
puts game.welcome_message
gets.chomp

game.sleep_mode
puts "Press a to start the game: \nPress b to see how to play: "
instruct = gets.chomp.downcase
until %w[a b].include? instruct
  game.sleep_mode
  puts 'Invalid Input!'
  game.sleep_mode
  puts "Press a to start the game: \nPress b to see how to play: "
  instruct = gets.chomp.downcase
end

if instruct == 'b'
  until instruct != 'b'
    puts game.instructions
    game.sleep_mode
    puts "Press b to see how to play: \nPress any other key to start the game: "
    instruct = gets.chomp.downcase
  end
end

game.sleep_mode
puts "Player 1, Enter your name: "
player1 = gets.chomp

until player1.is_a?(String) && player1.length > 1
  game.sleep_mode
  puts "Invalid Entry, name must be more than one character!\nPlayer 1, please re-enter your name: "
  player1 = gets.chomp
end

game.sleep_mode
puts "Player 2, Enter your name: "
player2 = gets.chomp

until player2.is_a?(String) && player2.length > 1
  game.sleep_mode
  puts "Invalid Entry, name must be more than one character!\nPlayer 2, please re-enter your name: "
  player2 = gets.chomp
end

game.sleep_mode
puts "Hello #{player1.capitalize} and #{player2.capitalize} :)"

random = Player.random_player(player1, player2)
player_first = random[0]
player_second = random[1]

game.sleep_mode
puts "#{player_first.capitalize} goes first!"
game.sleep_mode
puts "#{player_first.capitalize} choose your marker (X or O): "
marker1 = gets.chomp.upcase.to_sym
until [:X, :O].include? marker1
  game.sleep_mode
  puts "Invalid Entry #{player_first.capitalize}, please re-enter your marker: "
  marker1 = gets.chomp.upcase.to_sym
end

marker2 = marker1 == :X ? :O : :X

game.start_board(player_first, player_second, marker1, marker2)

game.sleep_mode
puts "#{player_first.capitalize}, your marker is #{game.current_player.marker}"
sleep(0.5)
puts "#{player_second.capitalize}, your marker is #{game.current_player.marker == :X ? :O : :X }"

game.sleep_mode
puts 'Displaying board...'
game.sleep_mode
puts game.draw_board

while game.game_on
  puts "\n\n"
  puts "#{game.current_player.name.capitalize} (#{game.current_player.marker}), choose your position, (1 - 9): "
  position = gets.chomp.to_i
  until game.board.valid?(position)
    game.sleep_mode
    puts "Invalid Entry #{game.current_player.name.capitalize}, re-enter your position: "
    position = gets.chomp.to_i
  end

  game.board.set_marker(position, game.current_player.marker)
  puts "\n\n"
  system('clear')

  puts game.draw_board
  game.sleep_mode
  if game.winner?(game.current_player)
    puts "Congratulations #{game.current_player.name.capitalize}!"
    game.current_player.add_score
  elsif game.tied?
    puts "Game Over! The game is a tie."
  end

  if game.winner?(game.current_player) || game.tied?
    game.sleep_mode
    puts "#{game.board.player1.name.capitalize} has #{game.board.player1.total_score}"
    puts "#{game.board.player2.name.capitalize} has #{game.board.player2.total_score}"
    
    game.sleep_mode
    puts 'Do you want to play again (y/n)'
    replay = gets.chomp.downcase
    until %w[y n].include? replay
      game.sleep_mode
      puts 'Invalid Entry!'
      puts 'Do you want to play again (y/n)'
      replay = gets.chomp.downcase
    end

    if replay == 'n'
      game.sleep_mode
      puts "Alright then! Bye #{game.board.player1.name.capitalize} and #{game.board.player2.name.capitalize} :)"
      game.game_status(false)
      game.sleep_mode
    elsif replay == 'y'
      game.sleep_mode
      puts "Alright then, replaying game for #{game.board.player1.name.capitalize} and #{game.board.player2.name.capitalize}!"
      sleep(0.5)
      puts '...'
      sleep(0.5)
      puts '...'
      sleep(0.5)

      system('clear')
      puts 'Displaying Board...'
      game.sleep_mode

      game.board.reset
      puts game.draw_board
      game.game_status(true)
    end
  end
  game.switch_player
end
