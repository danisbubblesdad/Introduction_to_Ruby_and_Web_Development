# => If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# => What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # => Error. This is a class method because of "self".
tv.model # => The model instance method will run.

Television.manufacturer # The manufacturer class method will run.
Television.model # => Error. The model is an instance method and Television is
                 # => a class.
