# frozen_string_literal: true

require_relative('board.rb')

class Game
  attr_reader :game_on, :board

  def initialize
    @game_on = true
  end

  def draw_board
    row = @board.cell_grid
    str = ''
    str += "Available      TIC-TAC_TOE\nmoves\n\n"
    str += "#{row[0]} | #{row[1]} | #{row[2]}       #{@board.available[0]} | #{@board.available[1]} | \
#{@board.available[2]}\n"
    str += "---------       --------- \n"
    str += "#{row[3]} | #{row[4]} | #{row[5]}       #{@board.available[3]} | #{@board.available[4]} | \
#{@board.available[5]}\n"
    str += "---------       --------- \n"
    str += "#{row[6]} | #{row[7]} | #{row[8]}       #{@board.available[6]} | #{@board.available[7]} | \
#{@board.available[8]}"
    str
  end

  def welcome_message
    str = "====================== \n"
    str += "WELCOME TO TIC TAC TOE \n"
    str += "====================== \n"
    str += "Press any key to continue: \n"
    str
  end

  def sleep_mode
    sleep(0.5)
    puts "\n\n"
  end

  def instructions
    str = "================================= \n"
    str += "You have chosen to see game rules \n"
    str += "================================= \n"

    str += "Game Rules \n"
    str += "1. The game is played on a grid that\'s 3 squares by 3 squares. \n"
    str += "2. It is played by two persons and in which one of you will be chosen at random to select a marker \
    (X or O) and also start the game. \n"
    str += "3. If you select X, the next player is O or vice-versa. Players take turns putting their marks in empty \
squares. \n"
    str += "4. The first player to get 3 of his/her marks in a row (up, down, across, or diagonally) is the winner. \n"
    str += "5. When all 9 squares are full, the game is over. If no player has 3 marks in a row, \
the game ends in a tie. \n"
    str
  end

  def start_board(player_first, player_second, marker1, marker2)
    @board = Board.new(player_first, player_second, marker1, marker2)
  end

  def winner?(player)
    @board.winning_position(player)
  end

  def tied?
    @board.available.none? { |x| x == ' ' }
  end

  def game_status(status)
    @game_on = status
  end
end
