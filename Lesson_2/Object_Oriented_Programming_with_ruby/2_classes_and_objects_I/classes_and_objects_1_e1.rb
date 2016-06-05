class MyCar

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    puts "Your #{@year} #{@color} #{@model} is going #{@speed} mph."
  end

  def speed_up(speed)
    @speed += speed
    puts "Your #{@year} #{@color} #{@model} is now going #{@speed} mph."
  end

  def brake(speed)
    @speed -= speed
    puts "Your #{@year} #{@color} #{@model} has slowed to #{@speed} mph."
  end

  def turn_off
    @speed = 0
    puts "Your #{@year} #{@color} #{@model} has stopped at #{@speed} mph."
  end
end


camaro = MyCar.new("1995", "Green", "Camaro")
camaro.speed_up(55)
camaro.speed_up(20)
camaro.brake(35)
camaro.brake(25)
camaro.turn_off
