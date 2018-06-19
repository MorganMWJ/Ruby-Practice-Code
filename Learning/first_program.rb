#My first ruby program
print "Enter a number: "
my_num = gets.to_i
if my_num % 2 == 0
	puts("Your number is even.")
else
	puts("Your number is odd.")
end

#example of code blocks
def func
	yield(5)
	yield(2)
end
func {|num| puts "Square of " + num.to_s + " equals: " + (num*num).to_s}
