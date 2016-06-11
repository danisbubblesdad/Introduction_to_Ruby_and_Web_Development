class Hand
  include Comparable

  attr_reader :value

  def initialize(hand)
    @value = hand
  end

  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value == 'p' && another_hand.value == 'r') ||
          (@value == 'r' && another_hand.value == 's') ||
          (@value == 's' && another_hand.value == 'p')
      1
    else
      -1
    end
  end

  def display_winning_message
    case @value
    when 'p'
      puts 'Paper wraps Rock!'
    when 'r'
      puts 'Rock crushes Scissors!'
    when 's'
      puts 'Scissors slice paper!'
    end
  end
end

class Player
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Computer < Player
  def pick_hand
    self.hand = Hand.new(Game::CHOICES.keys.sample)
  end
end

class Human < Player
  def pick_hand
    begin
      puts 'P, R, or S?'
      hand = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(hand)
    self.hand = Hand.new(hand)
  end
end

class Game
  CHOICES = { 'p' => 'paper', 'r' => 'rock', 's' => 'scissors' }.freeze

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
    compare_hands
  end
end

begin
  Game.new.play
  puts 'Would you like to play again? (y/n)'
  response = gets.chomp
end until response.casecmp('n') == 0
