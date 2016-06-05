require 'pry'

class Vehicle
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def self.mpg(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    puts "Your #{self.year} #{self.color} #{@model} is going #{@speed} mph."
  end

  def speed_up(speed)
    @speed += speed
    puts "Your #{self.year} #{self.color} #{@model} is now going #{@speed}
          mph."
  end

  def brake(speed)
    @speed -= speed
    puts "Your #{self.year} #{self.color} #{@model} has slowed to #{@speed}
          mph."
  end

  def turn_off
    @speed = 0
    puts "Your #{self.year} #{self.color} #{@model} has stopped at #{@speed}
          mph."
  end

  def show_year
    puts "Your #{self.color} #{@model} was made in #{self.year}."
  end

  def spray_paint(color)
    old_color = self.color
    self.color = color
    puts "*PSHHHHHHH* Your #{old_color} #{@model} is now #{self.color}."
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def to_s
    "My car is a #{color} #{year} #{model}."
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  def to_s
    "My truck is a #{color} #{year} #{model}."
  end
end
