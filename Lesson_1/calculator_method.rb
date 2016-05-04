def request_user_data(numbers_array, operator)
  say "Welcome to the world's finest archaic terminal calculator."
  say "Please enter your first number:"
  add_user_response_to_array(numbers_array)
  say "Please enter your second number:"
  add_user_response_to_array(numbers_array)

  operators = ["+","-","*","/"]

  while operators.include?(operator) == false
    say "Please enter a valid operator (+, -, *, /)"
    operator.replace(gets.chomp)
  end
end

def say(text)
  puts "=> #{text}"
end

def add_user_response_to_array(numbers)
  loop do
    input = gets.chomp
    if test_number_input(input) == true
      numbers.push(input)
      break
    end
  end
end

def test_number_input(input)
  if input[0] == "."
    input = "0" + input
  end
  if input.to_i.to_s == input || input.to_f.to_s == input
    true
  else
    say "**Entry is not a valid number. Try again.**"
    false
  end
end

def convert_strings_to_numbers(array)
  num1 = array.shift
  num2 = array.shift

  if num1.to_i.to_s != num1 || num2.to_i.to_s != num2
    array.push(num1.to_f)
    array.push(num2.to_f)
  else
    array.push(num1.to_i)
    array.push(num2.to_i)
  end
end

def perform_calculations(numbers_array, operator, output)
  output[0] =  if operator == "+"
              numbers_array[0] + numbers_array[1]
            elsif operator == "-"
              numbers_array[0] - numbers_array[1]
            elsif operator == "*"
              numbers_array[0] * numbers_array[1]
            elsif operator == "/"
              if numbers_array[0] % numbers_array[1] == 0
                numbers_array[0] / numbers_array[1]
              else
                numbers_array[0].to_f / numbers_array[1].to_f
              end
            end
end

def display_results_of_calculation(output)
  say "*Beep* *boop* *beep* *boop*."
  say "The calculated value is #{output[0]}."
  puts "----------------------------------"
end

def ask_to_restart_calculator
  loop do
    say "Would you like to use the calculator again? 'Y' or 'N'?"
    input = gets.chomp.upcase
    if input == "Y"
      calculator
      break
    elsif input == "N"
      say "Thank you for choosing the world's finest archaic terminal calculator for your mathematical needs."
      break
    end
  end
end

def calculator
  numbers_array = []
  operator = ""
  output = []
  request_user_data(numbers_array, operator)
  convert_strings_to_numbers(numbers_array)
  perform_calculations(numbers_array, operator, output)
  display_results_of_calculation(output)
  ask_to_restart_calculator
end

calculator
