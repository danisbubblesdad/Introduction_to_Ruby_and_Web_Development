class MyCar
  def self.mpg(gallons, miles)
    puts "#{miles/gallons} miles per gallon of gasoline."
  end
end

MyCar.mpg(10, 500)
