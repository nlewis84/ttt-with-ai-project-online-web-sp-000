module Players
  class Human < Player
    def move(board)
      puts "Select a spot (1 - 9):"
      gets.strip
    end
  end

end
