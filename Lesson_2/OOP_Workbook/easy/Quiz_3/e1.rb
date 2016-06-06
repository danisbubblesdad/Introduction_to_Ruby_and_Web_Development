# => If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# => What will happen in the following cases:

# Case 1
hello = Hello.new
hello.hi # => "Hello"; returns nil

# Case 2
hello = Hello.new
hello.bye # => Error. The "bye" method is not available in the Hello class.

# Case 3
hello = Hello.new
hello.greet # => Error. Missing 0 of 1 arguments Instead, try
            # => hello.greet("Hello")

# Case 4
hello = Hello.new
hello.greet("Goodbye") # => "Goodbye"; returns nil

# Case 5
Hello.hi # => Error. This is an instance method and not a class method, and
        # => therefore is not accessable to the class.
