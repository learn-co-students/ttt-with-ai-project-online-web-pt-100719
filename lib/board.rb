require 'pry'
class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def reset!
    @cells =[" "," "," "," "," "," "," "," "," "]
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    input = input.to_i
    cells[input-1]
  end
  
  def full?
   cells.none? do |cell|
     cell == " "
   end
  end
  
  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end
  
  def taken?(index)
    #binding.pry
   position(index) == "X" || position(index) == "O"
  end 
  
  def valid_move?(index)
    input = index.to_i 
    !(taken?(input))&& input.between?(1,9)
  end
  
  def update(index, player)
    input = index.to_i
    cells[input -1] = player.token
  end
  
  
end