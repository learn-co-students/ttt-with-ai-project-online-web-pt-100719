class Players
  class Computer < Player
    def move(board)
      random_position = rand(1..9)
      if board.valid_move?(random_position)
        random_position.to_s
      else
        move(board)
      end
    end
  end
end
