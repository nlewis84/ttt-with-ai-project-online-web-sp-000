class Game

  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def over?
      won? || draw?
    end

    def current_player
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def winner
      if winning_combo = won?
        @winner = @board.cells[winning_combo.first]
      end
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
          @board.cells[combo[0]] == @board.cells[combo[1]] &&
          @board.cells[combo[1]] == @board.cells[combo[2]] &&
          @board.taken?(combo[0]+1)
        end
      end

      def draw?
          @board.full? && !won?
      end

      def turn
# whose turn is it
        player = current_player
# what's the move
        current_move = player.move(board)
# is the move valid
        board.valid_move?(current_move)
# execute Order 66
        board.update(current_move, player)
# is the game over
        if over?
# if won, winner
          winner if won?
        else
# else turn
          turn
        end
      end
    end
