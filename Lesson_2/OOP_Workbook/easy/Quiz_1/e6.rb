# 6 - What could we add to the class below to access the instance variable
#     @volume?

class Cube
  attr_reader :volume #if we add an attr_reader we can access the
                        #instance variable. We could also add a method
                        #that returns the variable.

  def initialize(volume)
    @volume = volume
  end
end
