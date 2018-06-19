#1 Sum of all multiples of 3 or 5 below 1000
print (1..1000).find_all { |x| x%3==0 || x%5==0 }.inject(0) { |sum, el| sum+el}
puts ''

#3 Largest prime factor of 600851475143
def get_prime_factors(x)
  
end

puts get_prime_factors(600851475143).max
