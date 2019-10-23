class Players
  class Computer < Player
    def move(board)
      random_position = rand(1..9)
      random_position.to_s
    end
  end
end
