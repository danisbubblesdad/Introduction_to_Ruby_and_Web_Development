CHOICES = {'p' => "paper", 'r' => "rock", 's' => "scissors"}
WINNING_HANDS = {"p" => "r", "r" => "s", "s" => "p"}

puts "Paper, Rock, Scissors: THE GAME. V 0.0001"
puts "An action-packed game fit for all species with fingers and access to a computer terminal."

loop do
  begin
    puts "P, R, or S?"
    user_hand = gets.chomp.downcase
  end until CHOICES.keys.include?(user_hand)

  computer_hand = CHOICES.keys.sample

  system 'clear'
  system 'cls'
  puts "::As you show #{CHOICES[user_hand]},\n
        you see that the computer chose #{CHOICES[computer_hand]}::\n\n\n"

  if user_hand == computer_hand
    puts "TIE! You both chose #{CHOICES[user_hand]}"
  elsif WINNING_HANDS[user_hand] == computer_hand
    puts "You win! #{CHOICES[user_hand].capitalize} beats #{CHOICES[computer_hand]}!!"
  else
    puts "You lose! #{CHOICES[computer_hand].capitalize} beats #{CHOICES[user_hand]}.. :("
  end

  puts "\n\n\nPlay again? (y/n)"
  break if gets.chomp.downcase != 'y'
  system 'clear'
  system 'cls'

end

puts "Thank you for playing!"
