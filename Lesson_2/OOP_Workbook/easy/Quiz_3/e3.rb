# => 3 When objects are created they are a separate realization of a particular
# => class.

# => Given the class below, how do we create two different instances of this
# => class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# => Answer:
cat1 = AngryCat.new(12,"Jacko")
cat2 = AngryCat.new(9, "Layla")
