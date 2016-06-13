require 'pry'

# Write out a description of the program. Extract nouns from description and group common verbs into nouns.

# What is a tic tac toe game?

# An empty 3 x 3 board/grid.
# Two players: one player is "x", the other player is "o"
# Players alternate turns placing their symbols on the board in empty squares until sequence of three squares in vertical, horizontal, or diagonal orientation is achieved, or there are no squares left

class Game
  # Draw a board
  # assign player to "x" and computer to "o"
  # loop until winner or all square are taken
  #   player picks empty square
  #   check for winner
  def initialize
    @board = Board.new
    @human = Player.new("Chris","X")
    @computer = Player.new("Computer","O")
    @current_player = @human
  end

  def current_player_marks_square
    if @current_player == @human
      begin
      puts "Choose a position (1-9):"
      position = gets.chomp.to_i
    end until @board.empty_positions.include?(position)
    else
      position = @board.empty_positions.sample
    end
    @board.mark_square(position, @current_player.marker)
  end

  def alternate_player
    if @current_player == @human
      @current_player = @computer
    else
      @current_player == @human
    end
  end

  def play
    @board.draw
    loop do
      current_player_marks_square
      alternate_player
    end
  end
end

class Board
  # Define and draw board size
  # all squares marked?
  # find all empty squares
  def initialize
    @data = {}
    (1..9).each {|position| @data[position] = Square.new(' ')}
  end

  def draw
    system 'clear'
    system 'cls'
    puts " #{@data[1]} | #{@data[2]} | #{@data[3]} "
    puts "-----------"
    puts " #{@data[4]} | #{@data[5]} | #{@data[6]} "
    puts "-----------"
    puts " #{@data[7]} | #{@data[8]} | #{@data[9]} \n\n"
  end

  def all_squares_marked?
    empty_squares.size == 0
  end

  def empty_squares
    @data.select {|_, square| square.value == ' '}.values
  end

  def empty_positions
    @data.select {|_, square| square.empty? }.keys
  end

  def mark_square(position, marker)
    @data[position].mark(marker)
  end
end

class Square
  # Occupied?
  # Marker
  attr_accessor :value
  def initialize(value)
    @value = value
  end

  def mark(marker)
    @value = marker
  end

  def occupied?
    @value != ' '
  end

  def empty?
    @value == ' '
  end
end

class Player
  # name
  # mark(marker)
  attr_reader :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

Game.new.play
