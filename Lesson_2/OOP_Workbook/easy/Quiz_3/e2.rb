# => If we have this code:
# => If we call Hello.hi we get an error message. How would you fix this?
class Greeting
  def greet(message)
    puts message
  end
end

class Hello
  def self.hi # add self object
    greeting = Greeting.new # Insantiate a new Greeting object
    greeting.greet("Hello") # Use the greet method on this object in the context
                            # of the greet class.
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


Hello.hi
