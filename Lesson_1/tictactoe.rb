WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
OPPONENT_MARKERS = {"Player"=>"X", "Computer"=>"O"}

def initialize_board
  board = {}
  (1..9).each {|position| board[position] = ' '}
  board
end

def draw_board(b)
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "-----------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "-----------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def ask_user_for_square(b)
  begin
    puts "Choose an available square:"
    p empty_squares(b)
    square = gets.chomp.to_i
  end until empty_squares(b).include?(square)
  b[square] = OPPONENT_MARKERS["Player"]
end

def empty_squares(b)
  b.select {|k, v| v == ' '}.keys
end

def count_number_of_markers_in_line(b, line)
  counts = Hash.new 0
  OPPONENT_MARKERS.each do |name, marker|
    line.each do |square|
      if b[square] == marker
        counts[marker] += 1
      end
    end
  end
  counts
end

def find_empty_values_in_line(b, line)
  empty_values = Array.new
  line.each do |square|
    if b[square] == " "
      empty_values << square
    end
  end
  empty_values
end

def computer_decides_to_block_or_win(winning_options)
  if winning_options["Computer"]
    return winning_options["Computer"]
  elsif winning_options["Player"]
    return winning_options["Player"]
  else
    return nil
  end
end

def choose_winning_square(b)
  winning_options = Hash.new
  OPPONENT_MARKERS.each do |name, marker|
    WINNING_LINES.each do |line|
      if count_number_of_markers_in_line(b, line)[marker] == 2 && count_number_of_markers_in_line(b, line).keys.count == 1
        winning_options[name] = find_empty_values_in_line(b, line).sample
      end
    end
  end
  computer_decides_to_block_or_win(winning_options)
end

def choose_two_in_a_row(b)
  two_in_a_row_options = Hash.new
  OPPONENT_MARKERS.each do |name, marker|
    WINNING_LINES.each do |line|
      if count_number_of_markers_in_line(b, line)[marker] == 1 && count_number_of_markers_in_line(b, line).keys.count == 1
        two_in_a_row_options[name] = find_empty_values_in_line(b, line)
      end
    end
  end
  two_in_a_row_options
end

def computer_chooses_square(b)
  if choose_winning_square(b)
    square = choose_winning_square(b)
  elsif choose_two_in_a_row(b)
    square = choose_two_in_a_row(b).values.sample
    if square.is_a?(Array)
      square = square.sample
      square
    else
      square
    end
  else
    square = empty_squares(b).sample
  end
  b[square] = OPPONENT_MARKERS["Computer"]
end

def check_for_winner(b)
  OPPONENT_MARKERS.each do |name, marker|
    WINNING_LINES.each do |line|
      if count_number_of_markers_in_line(b, line)[marker] == 3
        return "#{name}"
      end
    end
  end
  return nil
end

def clear_screen
  system "clear"
  system "cls"
end

def ask_to_play_again
  loop do
    puts "\n\nWould you like to play again? (y/n)"
    response = gets.chomp.downcase
    if response == "y" || response == "n"
      return response
    end
  end
end

def determine_winner(winner)
  if winner == "Player"
    puts "\nYou won!"
  elsif winner == "Computer"
    puts "\nYou lost!! :("
  else
    puts "\nIt's a tie!"
  end
end

begin
clear_screen
board = initialize_board
draw_board(board)

  begin
    ask_user_for_square(board)
    winner = check_for_winner(board)
    clear_screen
      if winner
        draw_board(board)
        break
      end
    computer_chooses_square(board)
    draw_board(board)
    winner = check_for_winner(board)
  end until empty_squares(board).empty? || winner

  determine_winner(winner)

end until ask_to_play_again == "n"
