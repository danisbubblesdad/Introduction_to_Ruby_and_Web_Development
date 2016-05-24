SUITS = ["Hearts", "Diamonds", "Spades", "Clubs"]
CARDS = ["2", "3", "4", "5", "6", "7", "8", "9", "10",
         "Jack", "Queen", "King", "Ace"]

def loading(text, number_of_times)
  number_of_times.times do
    ["#","*","~"].each do |character|
      clear_screen
      puts "#{character} #{text} #{character}"
      sleep(0.2)
    end
  end
end

def clear_screen
  system "clear"
  system "cls"
end

def begin_hand
  loading("The dealer shuffles the deck", 3)
  deck = CARDS.product(SUITS)
  deck.shuffle!
end

def show_dealer_visible_card(dealer_hand)
  puts "The dealer is showing:"
  puts "#{dealer_hand[0][0].to_s} of #{dealer_hand[0][1].to_s}."
end

def display_cards(hand)
  formatted_hand = []
  hand.each do |card|
    formatted_hand.push(card.join(" of "))
  end
  formatted_hand
end

def recalculate_score_with_aces(score, ace_count)
  loop do
    if score <= 21
      return score
    else
      if ace_count > 0
        score -= 10
        ace_count -= 1
      else
        return score
      end
    end
  end
end

def calculate_score(hand)
  score = 0
  ace_count = 0
  hand.each do |card|
    if card[0] == "Ace"
      score += 11
      ace_count += 1
    elsif card[0].to_i == 0
      score += 10
    else
      score = score + card[0].to_i
    end
  end
  recalculate_score_with_aces(score, ace_count)
end

def show_hand_and_score(name, hand)
  puts "\n-----------------------------------------\n\n"
  puts "#{name} has:"
  puts display_cards(hand)
  puts "========================================="
  puts "#{name}'s score: #{calculate_score(hand)}"
end

def initial_deal(deck, player_name, player_hand, dealer_hand)
  2.times do
    player_hand.push(deck.pop)
    dealer_hand.push(deck.pop)
  end
  show_dealer_visible_card(dealer_hand)
  show_hand_and_score(player_name, player_hand)
end

def player_turn(deck, player_name, player_hand, dealer_hand)
  player_score = calculate_score(player_hand)
  if player_score == 21
    show_dealer_visible_card(dealer_hand)
    show_hand_and_score(player_name, player_hand)
    sleep(2)
    return 'Natural Blackjack'
  else
    begin
      hit_or_stand_response = hit_or_stand
      if hit_or_stand_response == "h"
        clear_screen
        player_hand.push(deck.pop)
        show_dealer_visible_card(dealer_hand)
        show_hand_and_score(player_name, player_hand)
      end
      player_score = calculate_score(player_hand)
    end until hit_or_stand_response == 's' || player_score > 21
  end
  player_score
end

def dealer_turn(deck, player_name, player_hand, dealer_hand)
  dealer_score = calculate_score(dealer_hand)
  if dealer_score == 21
    return 'Natural Blackjack'
  else
    begin
      clear_screen
      show_hand_and_score("Dealer", dealer_hand)
      show_hand_and_score(player_name, player_hand)
      if dealer_score < 17
        loading("The dealer hits.", 3)
        dealer_hand.push(deck.pop)
        clear_screen
        show_hand_and_score("Dealer", dealer_hand)
        show_hand_and_score(player_name, player_hand)
        sleep(3)
      else
        sleep(3)
      end
      dealer_score = calculate_score(dealer_hand)
    end until dealer_score > 16
  end
  dealer_score
end

def hit_or_stand
  puts "\n=> Please type 'h' for Hit or 's' for Stand.\n\n"
  user_response = gets.chomp
end

def request_player_name
  puts "\nPlease enter your name:"
  player_name = gets.chomp
  clear_screen
  loading("Hello, #{player_name}. Let's get started, shall we?", 2)
  player_name
end

def ask_to_play_again
  begin
    puts "\n\n\n\nWould you like to play again? 'y' or 'n'.\n\n\n"
    user_response = gets.chomp
  end until user_response == "y" || user_response == "n"
  user_response
end

clear_screen
puts "Welcome to Blackjack!"

# Ask for user's name
player_name = request_player_name

# Deal and display cards
begin
  deck = begin_hand
  initial_deal(deck, player_name, player_hand = Array.new,
               dealer_hand = Array.new)

# Begin player turn
  player_score = player_turn(deck, player_name, player_hand, dealer_hand)
  if player_score.to_i > 21
    sleep(2)
    loading("#{player_name} goes bust!", 2)
  else

# Begin dealer turn
    loading("Dealer reveals #{dealer_hand[1][0]} of #{dealer_hand[1][1]}.",2)
    dealer_score = dealer_turn(deck, player_name, player_hand, dealer_hand)

# Evaluate scores for win/loss/tie
    if dealer_score == 'Natural Blackjack' ||
       player_score == 'Natural Blackjack'
      if dealer_score == player_score
        loading("Push. The dealer and #{player_name} have the same score.", 2)
      elsif dealer_score == 'Natural Blackjack'
        loading("The dealer wins with a natural blackjack!", 2)
      else
        loading("#{player_name} wins with a natural blackjack!", 2)
      end
    elsif dealer_score == player_score
      loading("Push! Both #{player_name} and the dealer have the same score.",
              2)
    elsif dealer_score > 21
      loading("#{player_name} wins! The dealer goes bust..", 2)
    elsif player_score > dealer_score
      loading("#{player_name} wins! #{player_score} to #{dealer_score}.", 2)
    elsif dealer_score > player_score
      loading("The dealer wins. #{dealer_score} to #{player_score}.", 2)
    else
      loading("Push. #{dealer_score} to #{player_score}.")
    end
  end

# Ask to play again
end until ask_to_play_again == "n"
