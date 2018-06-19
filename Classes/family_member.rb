require_relative 'date'

class FamilyMember

  attr_accessor :name
  attr_accessor :age
  attr_accessor :birthday

  def initialize(name=nil,age=nil,birthday=nil)
    @name = name
    @age = age
    @birthday = birthday
  end

  def parse_member(input_string)
    split_input_string = input_string.split(":")
    @name = split_input_string[0]
    @age = split_input_string[1].to_i
    @birthday = Date.new().parse_date(split_input_string[2].chomp)
    return self
  end

  def to_s()
    "#{@name}:#{@age}:#{@birthday}"
  end

end
