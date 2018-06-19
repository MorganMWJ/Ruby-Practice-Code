class Date

  @@days_of_months = {1 => 31,   2 => [28,29],  3 => 31,
                      4 => 30,   5 => 31,       6 => 30,
                      7 => 31,   8 => 31,       9 => 30,
                      10 => 31,  11 => 30,      12 => 31}


  attr_accessor :day
  attr_accessor :month
  attr_accessor :year

  def initialize(day=nil,month=nil,year=nil)
    @day = day
    @month = month
    @year = year
  end

  private
  def leap_year?(year)
    (year % 4 == 0) && !(year % 100 == 0) || (year % 400 == 0)
  end

  def self.merge(left_sorted, right_sorted)
    res = []
    l = 0
    r = 0

    loop do
      break if r >= right_sorted.length and l >= left_sorted.length

      if r >= right_sorted.length or (l < left_sorted.length and left_sorted[l] < right_sorted[r])
        res << left_sorted[l]
        l += 1
      else
        res << right_sorted[r]
        r += 1
      end
    end

    return res
  end

  public
  def <=>(other_date)
    if @year == other_date.year
      if @month == other_date.month
        if @day == other_date.day
          return 0
        elsif @day < other_date.day
          return -1
        elsif @day > other_date.day
          return 1
        end
      elsif @month < other_date.month
        return -1
      elsif @month > other_date.month
        return 1
      end
    elsif @year < other_date.year
      return -1
    elsif @year > other_date.year
      return 1
    end
  end

  def <(other_date)
    self.<=>(other_date) == -1
  end

  def >(other_date)
    (self <=> other_date) == 1
  end

  def ==(other_date)
    (self <=> other_date) == 0
  end

  def self.birthday_sort(date_array)
    date_with_order_value_array = date_array.zip(date_array.map { |e| e.day+(e.month*100) })
    date_with_order_value_array.sort! {|a,b| a[1] <=> b[1]}
    ordered_dates = date_with_order_value_array.collect {|e| e[0]}
    return ordered_dates
  end

  def self.msort(date_array)
    return date_array if date_array.length <= 1

    mid = date_array.length/2 - 1
    left_sorted = msort(date_array[0..mid])
    right_sorted = msort(date_array[mid+1..-1])
    return merge(left_sorted, right_sorted)
  end

  def parse_date(date_string)
    split_date_string = date_string.split("/")

    #must be seperated by 3 '/'
    if split_date_string.length != 3
      raise ArgumentError.new("#{date_string} => Invalid date string.")
    end

    #must be positive integer strings
    split_date_string.each do |el|
      if el.to_i.to_s != el
        raise ArgumentError.new("#{date_string} => Invalid date string.")
      end
    end

    #month must be 1-12 inclusive
    if !(1..12).include?(split_date_string[1].to_i)
      raise ArgumentError.new("#{date_string} => Invalid date string.")
    end

    #day must adhere to monthly rules taking into account leap years
    case split_date_string[1].to_i
      when 2
        if leap_year?(split_date_string[2].to_i)
          if !(1..@@days_of_months[2][1]).include?(split_date_string[0].to_i)
            raise ArgumentError.new("#{date_string} => Invalid date string.")
          end
        else
          if !(1..@@days_of_months[2][0]).include?(split_date_string[0].to_i)
            raise ArgumentError.new("#{date_string} => Invalid date string.")
          end
        end
      else
        if !(1..@@days_of_months[split_date_string[1].to_i]).include?(split_date_string[0].to_i)
          raise ArgumentError.new("#{date_string} => Invalid date string.")
        end
    end

    @day = split_date_string[0].to_i
    @month = split_date_string[1].to_i
    @year = split_date_string[2].to_i
    return self
  end

  def to_s()
    return "#{@day}/#{@month}/#{@year}"
  end
end

=begin
  d1 = Date.new(11,4,2018)
  puts d1
  d2 = Date.new().parse_date("20/5/2018")
  puts d2
  d3 = Date.new().parse_date("29/2/2020")#valid becasue leap year
  puts d3
  d4 = Date.new().parse_date("28/2/2018")
  puts d4

  puts "28/2/2018 < 20/5/2018 => #{d4 < d2}"
  print Date.msort([d1,d2,d3,d4]).map! { |e| e.to_s }
  puts ''



  begin
    error_date = Date.new().parse_date("20/5")
  rescue ArgumentError => e
    puts e.message
  end

  begin
    error_date = Date.new().parse_date("Hello World")
  rescue ArgumentError => e
    puts e.message
  end

  begin
    error_date = Date.new().parse_date("20/red/2018")
  rescue ArgumentError => e
    puts e.message
  end

  begin
    error_date = Date.new().parse_date("20/30/2018")
  rescue ArgumentError => e
    puts e.message
  end

  begin
    error_date = Date.new().parse_date("40/6/2018")
  rescue ArgumentError => e
    puts e.message
  end

  begin
    error_date = Date.new().parse_date("29/2/2018")
  rescue ArgumentError => e
    puts e.message
  end

  begin
    error_date = Date.new().parse_date("29/2/2020")
  rescue ArgumentError => e
    puts e.message
  end

  begin
    error_date = Date.new().parse_date("31/11/2020")
  rescue ArgumentError => e
    puts e.message
  end
=end
