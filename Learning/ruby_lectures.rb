#Ruby Lecture Exercises

#Blocks & Iterators
def fac(x)
	if x < 1
		return 0
	end
	(1..x).inject { |sum, el| sum *= el}
end

def n_times(n)
	for i in (1..n)
		yield(i) #calls the block attached to this function passing it i as a block param
	end
end

def test_yield
	yield(3)
	yield(5)
end

class Repeat

	def initialize(number)
		@num = number
	end

	def each(&block)
		for i in (1..@num)
			block.call
		end
	end

end

#Control Flow
def fib_rec(i)
	(i <= 1) ? i : (fib_rec(i-1) + fib_rec(i-2))
end

#############################################
puts "5th in Fib sequence: #{fib_rec(5)}"
puts "Factorial of 5: #{fac 5}"
