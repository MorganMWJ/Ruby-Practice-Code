class Person

  #attr_accessor generates getters & setters
  attr_accessor :name
  attr_accessor :age
  attr_accessor :number

  def initialize(name, age, number)
    @name = name
    @age = age
    @number = number
  end

  def to_string()
    "Name: #{@name}\nAge: #{@age}\nMobile Number: #{@number}"
  end
end

p = Person.new("Morgan", 21, "07578939321")
puts p.to_string()
puts ''
p.name += " Jones"
puts p.to_string()
puts ''
########################################################################
include Math

class Circle

  @@no_of_circles = 0

  attr_accessor :radius #generate getter & setter for radius
  attr_reader :id #only want a getter for id

  def initialize(radius)
    @radius = radius
    @@no_of_circles += 1
    @id = @@no_of_circles
  end

  def circumference()
    2*PI*radius
  end

  def area()
    PI*(radius**2)
  end

  def diameter()
    radius*2
  end

  def to_string()
    res = ""
    res += "ID: #{id}\n"
    res += "Radius: #{radius}\n"
    res += "Diameter: #{self.diameter()}\n"
    res += "Area: #{area()}\n"
    res += "Circumference: #{circumference}"
    res
  end
end

c = Circle.new(5)
puts c.to_string

###########################################################################
#class for a linked list node

# class LLNode
#
#   attr_accessor :value
#   attr_accessor :nextNode
#
#   def initialize(value)
#     @value = value
#     @nextNode = nil
#   end
#
#   def to_s()
#     "#{value}"
#   end
# end
#
# class LinkedList
#
#   attr_accessor :size
#
#   def initialize(firstObject)
#     @head = LLNode.new(firstObject)
#     @size = 1
#   end
#
#   def append(object)
#     tempNode = @head
#     for i in 1..@size do
#       tempNode = tempNode.nextNode
#     end
#     tempNode.value = object
#     @size += 1
#   end
#
#   def printList
#     tempNode = @head
#     while tempNode != nil
#       print "[#{tempNode}]"
#       tempNode = tempNode.next
#     end
#   end
#
# end
#
# ll = LinkedList.new(56)
# print ll.size
# ll.append(23)
