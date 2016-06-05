class MyCar
  attr_accessor :color
  attr_reader :year

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


camaro = MyCar.new("1995", "Green", "Camaro")
camaro.spray_paint("White")
