class MyCar
  attr_reader :year, :color, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
  end

  def to_s
    "I like that #{color} #{year} #{model}."
  end
end

fiat = MyCar.new("2012", "Grigio", "Fiat")
puts fiat
