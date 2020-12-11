module Players
  class Computer < Player
    def move(board)
        binding.pry
        board.cells.each_with_index do |cell, index|
          if cell == " "
            return (index + 1).to_s
          end
        end
    end
  end
end
