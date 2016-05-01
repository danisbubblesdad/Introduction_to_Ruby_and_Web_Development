def test_number_input(input)
  if input[0] == "."
    input = "0" + input
  end
  klass = eval(input).class
    return true
  rescue NameError
    say "**Entry is not a valid number. Try again.**"
    return false
  rescue SyntaxError
    say "**Entry is not a valid number. Try again.**"
    return false
end

def say(text)
  puts "=> #{text}"
end

def push_number_to_array(numbers)
  loop do
    input = gets.chomp
    if test_number_input(input) == true
      numbers.push(input)
      break
    end
  end
end

loop do
  numbers = []

  say "Welcome to the world's finest archaic terminal calculator."
  say "Please enter your first number:"
  push_number_to_array(numbers)
  say "Please enter your second number:"
  push_number_to_array(numbers)

  operators = ["+","-","*","/"]
  operator = ""
  input = ""

  while operators.include?(operator) == false
    say "Please enter a valid operator (+, -, *, /)"
    operator = gets.chomp
  end

  num1 = numbers[0]
  num2 = numbers[1]

  if num1.to_i.to_s != num1 || num2.to_i.to_s != num2
    num1 = num1.to_f
    num2 = num2.to_f
  else
    num1 = num1.to_i
    num2 = num2.to_i
  end

  if operator == "+"
    output = num1 + num2
  elsif operator == "-"
    output = num1 - num2
  elsif operator == "*"
    output = num1 * num2
  elsif operator == "/"
    if num1 % num2 != 0
      output = num1.to_f / num2.to_f
    else
      output = num1 / num2
    end
  end

  say "*Beep* *boop* *beep* *boop*."
  say "The calculated value is #{output}."
  puts "----------------------------------"

  loop do
    say "Would you like to use the calculator again? 'Y' or 'N'?"
    input = gets.chomp.upcase
    if input == "N"
      say "Thank you for choosing the world's finest archaic terminal calculator for your mathmatical needs."
      break
    elsif input == "Y"
      say "Let's go again!"
      puts "-------------------------------"
      break
    else
      say "Unrecognized entry. Try again."
    end
  end

  if input == "N"
    break
  end

end
