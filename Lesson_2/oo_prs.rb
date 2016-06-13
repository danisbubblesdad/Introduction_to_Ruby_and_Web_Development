# :nodoc:
module Clearable
  def clear_screen
    system 'clear'
    system 'cls'
  end
end

# :nodoc:
class Hand
  WINS = { 'p' => 'r', 'r' => 's', 's' => 'p' }.freeze

  include Comparable

  attr_reader :value

  def initialize(hand)
    @value = hand
  end

  def <=>(other)
    if value == other.value
      0
    elsif WINS[value] == other.value
      1
    else
      -1
    end
  end

  def display_winning_message
    case value
    when 'p'
      puts 'Paper wraps Rock!'
    when 'r'
      puts 'Rock crushes Scissors!'
    when 's'
      puts 'Scissors slice paper!'
    end
  end
end

# :nodoc:
class Player
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# :nodoc:
class Computer < Player
  def pick_hand
    self.hand = Hand.new(Game::CHOICES.keys.sample)
  end
end

# :nodoc:
class Human < Player
  def pick_hand
    begin
      puts 'P, R, or S?'
      hand = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(hand)
    self.hand = Hand.new(hand)
  end
end

# :nodoc:
class Game
  CHOICES = { 'p' => 'paper', 'r' => 'rock', 's' => 'scissors' }.freeze
  include Clearable

  attr_reader :user, :computer

  def initialize
    @user = Human.new('Dan')
    @computer = Computer.new('Computer')
  end

  def compare_hands
    if user.hand == computer.hand
      puts "It's a tie! You both selected #{CHOICES[user.hand.value]}!"
    elsif user.hand > computer.hand
      puts 'You win!'
      user.hand.display_winning_message
    else
      puts 'You lose :(.'
      computer.hand.display_winning_message
    end
  end

  def play
    user.pick_hand
    computer.pick_hand
    clear_screen
    compare_hands
  end
end

loop do
  include Clearable
  clear_screen
  Game.new.play
  puts "\n\nWould you like to play again? (y/n)"
  response = gets.chomp
  break if response.casecmp('n') == 0
end
