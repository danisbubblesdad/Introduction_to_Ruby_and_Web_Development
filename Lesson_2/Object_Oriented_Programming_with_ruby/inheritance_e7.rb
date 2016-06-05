require 'pry'

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(comparison_student)
    grade > comparison_student.grade
  end

  protected

  def grade
    @grade
  end
end

daniel = Student.new("Daniel", 80)
ashley = Student.new("Ashley", 99)

puts "Well done, Ashley!" if ashley.better_grade_than?(daniel)
puts "Well done, Daniel!" if daniel.better_grade_than?(ashley)
