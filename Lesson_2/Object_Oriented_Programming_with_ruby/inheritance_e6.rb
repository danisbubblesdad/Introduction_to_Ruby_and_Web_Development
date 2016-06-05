require 'pry'

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color, :year, :model

  def self.mpg(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def self.number_of_vehicles
    puts "You have created #{@@number_of_vehicles} vehicles."
  end

  def initialize(year, color, model)
    @@number_of_vehicles += 1
    self.year = year
    self.color = color
    self.model = model
    @speed = 0
    puts "Your #{self.year} #{self.color} #{self.model} is going #{@speed} mph."
  end

  def speed_up(speed)
    @speed += speed
    puts "Your #{self.year} #{self.color} #{self.model} is now going #{@speed}
          mph."
  end

  def brake(speed)
    @speed -= speed
    puts "Your #{self.year} #{self.color} #{self.model} has slowed to #{@speed}
          mph."
  end

  def turn_off
    @speed = 0
    puts "Your #{self.year} #{self.color} #{self.model} has stopped at #{@speed}
          mph."
  end

  def show_year
    puts "Your #{self.color} #{self.model} was made in #{self.year}."
  end

  def spray_paint(color)
    old_color = self.color
    self.color = color
    puts "*PSHHHHHHH* Your #{old_color} #{self.model} is now #{self.color}."
  end

  def age
    "Your #{self.model} is #{age_of_vehicle} years old."
  end

  private

  def age_of_vehicle
    Time.now.year - self.year.to_i
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def to_s
    "My car is a #{color} #{year} #{model}."
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2
  def to_s
    "My truck is a #{color} #{year} #{model}."
  end
end

camaro = MyCar.new("1995", "Green", "Camaro")
puts camaro.age
