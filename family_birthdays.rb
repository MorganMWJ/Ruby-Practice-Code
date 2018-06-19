require_relative 'classes/date'
require_relative 'classes/family_member'

def get_todays_birthdays(all_family)
  family_with_birthdays = []
  time_now = Time.new
  all_family.each do |m|
    if m.birthday.day == time_now.day && m.birthday.month == time_now.month
      family_with_birthdays << m
    end
  end
  return family_with_birthdays
end

def save(all_family)
  file = File.open("Resources/family_birthdays.txt", "w")
  all_family.each do |f|
    file.write f.to_s
  end
  file.close
end

def load()
  file = File.open("Resources/family_birthdays.txt", "r")
  family = file.readlines()
  file.close
  return family.map! { |e| FamilyMember.new().parse_member(e) }
end

def printMenu(family_with_birthdays)
  puts '-'*30
  puts "\tToday's birthdays"
  puts ''
  family_with_birthdays.each {|f| puts "#{f.to_s()}"}
  puts '-'*30
  puts "1. Add a family birthday"
  puts "2. List all family birthdays"
  puts "3. Quit"
  return 3
end

def get_user_choice(max)
  input = 0
  bad_input = true

  while bad_input
    print "=> "
    input = gets.chomp().to_i
    if input <= max && input >= 1
      bad_input = false
    else
      puts "Need integer between 1 and #{max}!"
    end
  end
  puts '-'*30
  return input
end

def add_birthday

end

family_members = load()
running = true
while running
  case get_user_choice(printMenu(get_todays_birthdays(family_members)))
    when 1
      save family_members
      puts "Birthday Added!"
    when 2
      puts family_members
    when 3
      running = false
    end
end
