class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if(@board.turn_count.even?)
      @player_1
    else
      @player_2
    end
  end

  def won?
    winning = []
    WIN_COMBINATIONS.each_with_index { |combination,i|
      winning[i] = []
      combination.each{ |index|
        if(@board.cells[index] == "X") # Check if X is the winner
          winning[i] << combination
        else
          winning[i] << false
        end
      }
    }

    winning = winning.find {|e| !e.include?(false)}
    if(winning)
      winning[0]
    else # if_not, then it checks if O is the winner and show our final result
      winning = []
      WIN_COMBINATIONS.each_with_index { |combination,i|
        winning[i] = []
        combination.each{ |index|
          if(@board.cells[index] == "O")
            winning[i] << combination
          else
            winning[i] << false
          end
        }
      }
      winning = winning.find {|e| !e.include?(false)}
      if(winning)
        winning[0]
      else
        winning
      end
    end
  end

  def draw?
    if !won? && @board.full?
      true
    elsif !won? && !@board.full?
      false
    else won?
      false
    end
  end

  def over?
    if(draw? || won? || @board.full?)
      true
    else
      false
    end
  end

  def winner
    if(won?)
      winning = @board.cells[won?[0]]
      if winning.include?("X")
        "X"
      elsif winning.include?("O")
        "O"
      end
    else
      nil
    end
  end

  def turn
    input = current_player.move(@board)
    @valid_move = @board.valid_move?(input)
    @current_player = current_player

    if(@valid_move)
      @board.update(input,@current_player)
      @board.display
    else
      puts "#{@current_player.token} made an invalid movement. Try again!"
      @current_player.move(@board)
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
