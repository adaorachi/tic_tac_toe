# frozen_string_literal: true

require_relative('../lib/player.rb')
require_relative('../lib/board.rb')
require_relative('../lib/game.rb')

RSpec.describe 'Tic_Tac_Toe' do
  let(:game) { Game.new }

  describe 'Player wins' do
    describe 'Rows' do
      it 'Check win first row for player 1' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(1, game.board.player1.marker)
        game.board.set_marker(2, game.board.player1.marker)
        game.board.set_marker(3, game.board.player1.marker)
        expect(game.winner?(game.board.player1)).to eql(true)
      end
      it 'Check win second row for player 1' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(4, game.board.player1.marker)
        game.board.set_marker(5, game.board.player1.marker)
        game.board.set_marker(6, game.board.player1.marker)
        expect(game.winner?(game.board.player1)).to eql(true)
      end
      it 'Check win third row for player 1' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(7, game.board.player1.marker)
        game.board.set_marker(8, game.board.player1.marker)
        game.board.set_marker(9, game.board.player1.marker)
        expect(game.winner?(game.board.player1)).to eql(true)
      end
      it 'Check win first row for player 2' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(1, game.board.player2.marker)
        game.board.set_marker(2, game.board.player2.marker)
        game.board.set_marker(3, game.board.player2.marker)
        expect(game.winner?(game.board.player2)).to eql(true)
      end
      it 'Check win second row for player 2' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(4, game.board.player2.marker)
        game.board.set_marker(5, game.board.player2.marker)
        game.board.set_marker(6, game.board.player2.marker)
        expect(game.winner?(game.board.player2)).to eql(true)
      end
      it 'Check win third row for player 2' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(7, game.board.player2.marker)
        game.board.set_marker(8, game.board.player2.marker)
        game.board.set_marker(9, game.board.player2.marker)
        expect(game.winner?(game.board.player2)).to eql(true)
      end
    end
    describe 'Columns' do
      it 'Check win first column for player 1' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(1, game.board.player1.marker)
        game.board.set_marker(4, game.board.player1.marker)
        game.board.set_marker(7, game.board.player1.marker)
        expect(game.winner?(game.board.player1)).to eql(true)
      end
      it 'Check win second column for player 1' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(2, game.board.player1.marker)
        game.board.set_marker(5, game.board.player1.marker)
        game.board.set_marker(8, game.board.player1.marker)
        expect(game.winner?(game.board.player1)).to eql(true)
      end
      it 'Check win third column for player 1' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(3, game.board.player1.marker)
        game.board.set_marker(6, game.board.player1.marker)
        game.board.set_marker(9, game.board.player1.marker)
        expect(game.winner?(game.board.player1)).to eql(true)
      end
      it 'Check win first column for player 2' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(1, game.board.player2.marker)
        game.board.set_marker(4, game.board.player2.marker)
        game.board.set_marker(7, game.board.player2.marker)
        expect(game.winner?(game.board.player2)).to eql(true)
      end
      it 'Check win second column for player 2' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(2, game.board.player2.marker)
        game.board.set_marker(5, game.board.player2.marker)
        game.board.set_marker(8, game.board.player2.marker)
        expect(game.winner?(game.board.player2)).to eql(true)
      end
      it 'Check win third column for player 2' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(3, game.board.player2.marker)
        game.board.set_marker(6, game.board.player2.marker)
        game.board.set_marker(9, game.board.player2.marker)
        expect(game.winner?(game.board.player2)).to eql(true)
      end
    end
    describe 'Diagonals' do
      it 'Check win first diagonal for player 1' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(1, game.board.player1.marker)
        game.board.set_marker(5, game.board.player1.marker)
        game.board.set_marker(9, game.board.player1.marker)
        expect(game.winner?(game.board.player1)).to eql(true)
      end
      it 'Check win second diagonal for player 1' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(3, game.board.player1.marker)
        game.board.set_marker(5, game.board.player1.marker)
        game.board.set_marker(7, game.board.player1.marker)
        expect(game.winner?(game.board.player1)).to eql(true)
      end
      it 'Check win first diagonal for player 2' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(1, game.board.player2.marker)
        game.board.set_marker(5, game.board.player2.marker)
        game.board.set_marker(9, game.board.player2.marker)
        expect(game.winner?(game.board.player2)).to eql(true)
      end
      it 'Check win second diagonal for player 2' do
        game.start_board('Player 1', 'Player 2', :X, :O)
        game.board.set_marker(3, game.board.player2.marker)
        game.board.set_marker(5, game.board.player2.marker)
        game.board.set_marker(7, game.board.player2.marker)
        expect(game.winner?(game.board.player2)).to eql(true)
      end
    end
  end

  describe 'Game is tie' do
    it 'Check if no player wins ' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      game.board.set_marker(5, game.board.player1.marker)
      game.board.set_marker(1, game.board.player2.marker)
      game.board.set_marker(2, game.board.player1.marker)
      game.board.set_marker(8, game.board.player2.marker)
      game.board.set_marker(4, game.board.player1.marker)
      game.board.set_marker(6, game.board.player2.marker)
      game.board.set_marker(3, game.board.player1.marker)
      game.board.set_marker(7, game.board.player2.marker)
      game.board.set_marker(9, game.board.player1.marker)
      expect(game.tied?).to eql(true)
    end

    it 'Check if no player wins ' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      game.board.set_marker(1, game.board.player1.marker)
      game.board.set_marker(2, game.board.player2.marker)
      game.board.set_marker(5, game.board.player1.marker)
      game.board.set_marker(3, game.board.player2.marker)
      game.board.set_marker(6, game.board.player1.marker)
      game.board.set_marker(4, game.board.player2.marker)
      game.board.set_marker(7, game.board.player1.marker)
      game.board.set_marker(9, game.board.player2.marker)
      game.board.set_marker(8, game.board.player1.marker)
      expect(game.tied?).to eql(true)
    end

    it 'Check if no player wins ' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      game.board.set_marker(1, game.board.player1.marker)
      game.board.set_marker(3, game.board.player2.marker)
      game.board.set_marker(2, game.board.player1.marker)
      game.board.set_marker(4, game.board.player2.marker)
      game.board.set_marker(6, game.board.player1.marker)
      game.board.set_marker(5, game.board.player2.marker)
      game.board.set_marker(7, game.board.player1.marker)
      game.board.set_marker(8, game.board.player2.marker)
      game.board.set_marker(9, game.board.player1.marker)
      expect(game.tied?).to eql(true)
    end

    it 'Check if no player wins ' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      game.board.set_marker(1, game.board.player1.marker)
      game.board.set_marker(3, game.board.player2.marker)
      game.board.set_marker(2, game.board.player1.marker)
      game.board.set_marker(4, game.board.player2.marker)
      game.board.set_marker(6, game.board.player1.marker)
      game.board.set_marker(5, game.board.player2.marker)
      game.board.set_marker(7, game.board.player1.marker)
      game.board.set_marker(9, game.board.player2.marker)
      game.board.set_marker(8, game.board.player1.marker)
      expect(game.tied?).to eql(true)
    end
  end

  describe 'Game behaviour' do
    it 'Check if position 3 is already taken' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      game.board.set_marker(3, game.board.player1.marker)
      expect(game.board.valid?(3)).to eql(false)
    end

    it 'Check if position 1 is already taken' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      game.board.set_marker(1, game.board.player2.marker)
      expect(game.board.valid?(1)).to eql(false)
    end

    it 'Check if position 5 is available' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      expect(game.board.valid?(5)).to eql(true)
    end

    it 'Check if position 7 is available' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      expect(game.board.valid?(7)).to eql(true)
    end

    it 'Check if position is out of range 1..9' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      expect(game.board.valid?(10)).to eql(false)
    end

    it 'Check if entry is invalid' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      expect(game.board.valid?('a')).to eql(false)
    end

    it 'Check if entry is invalid' do
      game.start_board('Player 1', 'Player 2', :X, :O)
      expect(game.board.valid?('~')).to eql(false)
    end
  end
end
