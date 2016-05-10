CHOICES = {'p' => "paper", 'r' => "rock", 's' => "scissors"}
WINNING_HANDS = {"p" => "r", "r" => "s", "s" => "p"}

puts "Paper, Rock, Scissors: THE GAME. V 0.0001"
puts "An action-packed game fit for all species with fingers and access to a computer terminal."

loop do
  game_hands = {}
  begin
    puts "P, R, or S?"
    game_hands[:user_hand] = gets.chomp.downcase
  end until CHOICES.keys.include?(game_hands[:user_hand])

  game_hands[:computer_hand] = CHOICES.keys.sample

  system 'clear'
  system 'cls'
  puts "::As you show #{CHOICES[game_hands[:user_hand]]},\n
        you see that the computer chose #{CHOICES[game_hands[:computer_hand]]}::"
  puts ""
  puts ""

  if game_hands[:user_hand] == game_hands[:computer_hand]
    puts "TIE! You both chose #{CHOICES[game_hands[:user_hand]]}"
  elsif WINNING_HANDS[game_hands[:user_hand]] == game_hands[:computer_hand]
    puts "You win! #{CHOICES[game_hands[:user_hand]].capitalize} beats #{CHOICES[game_hands[:computer_hand]]}!!"
  else
    puts "You lose! #{CHOICES[game_hands[:computer_hand]].capitalize} beats #{CHOICES[game_hands[:user_hand]]}.. :("
  end

  puts ""
  puts ""
  puts "Play again? (y/n)"
  break if gets.chomp.downcase != 'y'
  system 'clear'
  system 'cls'

end

puts "Thank you for playing!"
