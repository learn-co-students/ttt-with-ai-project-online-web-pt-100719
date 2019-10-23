class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i
    @cells[input-1]
  end

  def full?
    @cells.none? { |cell| cell==" " } ? true : false
  end

  def turn_count
    count = 0
    @cells.each {|cell| count += 1 unless cell==" "}
    count
  end

  def taken?(position)
    position = position.to_i
    @cells[position-1].include?("X") || @cells[position-1].include?("O") ? true : false
  end

  def valid_move?(position)
    position = position.to_i
    !taken?(position) && position>0 && position < 10 ? true : false
  end

  def update(position, player)
    position = position.to_i
    @cells[position-1] = player.token
  end
end
