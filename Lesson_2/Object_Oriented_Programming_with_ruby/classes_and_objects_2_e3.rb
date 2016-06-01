require "pry"
class Person
  # attr_reader :name is incorrect. We need to be able to WRITE in order to
  # update the name instance variable for the bob object in the Person class.
  attr_writer :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
binding.pry
