require_relative 'classes/date'

d1 = Date.new(11,4,2018)
puts d1
d2 = Date.new().parse_date("20/5/2018")
puts d2
d3 = Date.new().parse_date("29/2/2020")#valid becasue leap year
puts d3
d4 = Date.new().parse_date("28/2/2018")
puts d4

puts "28/2/2018 < 20/5/2018 => #{d4 < d2}"
print "Normal Sort => #{Date.msort([d1,d2,d3,d4]).map! { |e| e.to_s }}"
puts ''
print "Birthday Sort => #{Date.birthday_sort([d1,d2,d3,d4]).map! { |e| e.to_s }}"
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
