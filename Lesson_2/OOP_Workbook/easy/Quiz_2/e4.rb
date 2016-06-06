# 4. What could you add to this class to simplify it and remove two methods
#    from the class definition while still maintaining the same functionality?

class BeesWax
  attr_accessor :type # => add this line

  def initialize(type)
    @type = type
  end

  #def type  => Remove this method due to addition of attr_accessor
  #  @type
  #end

  #def type=(t) => Remove this method due to addition of attr_accessor
  #  @type = t
  #end

  def describe_type
    puts "I am a #{type} of Bees Wax" #remove @ symbol due to attr_accessor
  end
end
