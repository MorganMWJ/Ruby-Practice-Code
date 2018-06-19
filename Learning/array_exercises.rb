#File containing small programming excersises
test_arr = [7,40,50,2,3,67,40]

def get_n_random_elements(arr, n)
  result_array = Array.new()
  n.times {result_array << arr[rand(arr.length)]}
  return result_array
end

puts print get_n_random_elements(test_arr, 2)
#########################################################
 def first_or_last?(arr, value)
   if arr[0] == value || arr[arr.length-1] == value
     return true
   else
     return false
   end
 end

puts first_or_last?(test_arr, 7)
puts first_or_last?(test_arr, 8)
##########################################################
def contains?(arr, value)
  arr.each {|el| return true if el==value}
  false
end

puts contains?(test_arr, 40)
puts contains?(test_arr, 41)
###########################################################
def sum_array(arr)
  arr.inject(0) {|sum, el| sum+el}
end

puts sum_array(test_arr)
###########################################################
def same_first_and_last?(arr)
  if arr[0] == arr[arr.length-1]
    true
  else
    false
  end
end

puts same_first_and_last?(test_arr)
#############################################################
def remove_duplicates(arr)
  arr.uniq#this function does it for you :-)
end

print remove_duplicates(test_arr)
############################################################
