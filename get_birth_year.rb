def get_birth_year(age,birth_month,birth_day)
  time = Time.new
  current_day = time.day
  current_month = time.month
  current_year = time.year

  if birth_month > current_month
    return (current_year-age)-1
  elsif birth_month == current_month
    if birth_day > current_day
      return (current_year-age)-1
    else
      return current_year-age
    end
  else
    return current_year-age
  end
end

while true
  print "Enter Age: "
  age = gets.chomp().to_i
  print "Enter birth day: "
  day = gets.chomp().to_i
  print "Enter birth month: "
  month = gets.chomp().to_i
  puts "Born in year: #{get_birth_year(age,month,day)}"
  puts '-'*50
end
