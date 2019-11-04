#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative('../lib/player.rb')
require_relative('../lib/board.rb')
require_relative('../lib/game.rb')

game = Game.new

puts game.welcome_message
gets.chomp
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
    puts "Press b to see how to play: \nPress any other key to start the game: "
    instruct = gets.chomp.downcase
  end
end

puts "Player 1, Enter your name: "
player1 = gets.chomp

until player1.is_a?(String) && player1.length > 1
  game.sleep_mode
  puts "Invalid Entry, name must be more than one character!\nPlayer 1, please re-enter your name: "
  player1 = gets.chomp
end

puts "Player 2, Enter your name: "
player2 = gets.chomp

until player2.is_a?(String) && player2.length > 1
  game.sleep_mode
  puts "Invalid Entry, name must be more than one character!\nPlayer 2, please re-enter your name: "
  player2 = gets.chomp
end

puts "Hello #{player1.capitalize} and #{player2.capitalize} :)"

random = Player.random_player(player1, player2)
player_first = random[0]
player_second = random[1]

puts "#{player_first.capitalize} choose your marker (X or O): "
marker1 = gets.chomp.upcase.to_sym
until [:X, :O].include? marker1
  game.sleep_mode
  puts "Invalid Entry #{player_first.capitalize}, please re-enter your marker: "
  marker1 = gets.chomp.upcase.to_sym
end

marker2 = marker1 == :X ? :O : :X

game.start_board(player_first, player_second, marker1, marker2)

current_player = player_first == game.board.player1.name ? game.board.player1 : game.board.player2

puts "#{player_first.capitalize}, your marker is #{current_player.marker}"
sleep(2)
puts "#{player_second.capitalize}, your marker is #{current_player.marker == :X ? :O : :X }"
puts "#{current_player.name.capitalize} goes first!"
puts 'Displaying board...'
game.sleep_mode
puts game.draw_board
while game.game_on
  puts "#{current_player.name.capitalize} (#{current_player.marker}), choose your position, (1 - 9): "
  position = gets.chomp.to_i
  until game.board.valid?(position)
    game.sleep_mode
    puts "Invalid Entry #{current_player.name.capitalize}, re-enter your position: "
    position = gets.chomp.to_i
  end

  game.board.set_marker(position, current_player.marker)
  game.sleep_mode
  system('clear')

  puts game.draw_board
  puts "\n\n"
  if game.winner?(current_player)
    puts "Congratulations message"
    current_player.add_score
    puts "#{game.board.player1.name.capitalize} has #{game.board.player1.total_score}"
    puts "#{game.board.player2.name.capitalize} has #{game.board.player2.total_score}"
  end

  if game.winner?(current_player) || game.tied?
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
      sleep(1)
      puts '...'
      sleep(1)
      puts '...'
      sleep(1)
      puts '...'
      sleep(1)

      system('clear')
      puts 'Displaying Board...'
      game.sleep_mode

      game.board.reset
      puts game.draw_board
      game.game_status(true)
    end
  end
  current_player = current_player.name == game.board.player1.name ? game.board.player2 : game.board.player1
end
