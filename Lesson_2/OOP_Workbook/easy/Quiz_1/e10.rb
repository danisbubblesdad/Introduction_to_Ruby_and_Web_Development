# 10. If we have the class below, what would you need to call to create a new
#     instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# Answer:

paper_bag = Bag.new("brown", "paper")

p paper_bag
