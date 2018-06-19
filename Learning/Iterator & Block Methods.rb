#Utility function to add space
###################
def add_space()
  puts ''
  puts ''
  puts ''
end
###################

#each
["Morgan Jones", 21].each {|element| puts "Print from each method: #{element}"}
add_space

#collect - collects the changed array/hash and returns it
b = [100,200,300,400,500].collect { |el| el/10}
print b
add_space
a = [3,6,9]
a.collect! {|x| x/3}
print "a => #{a}"
add_space

#times
5.times { puts 'Hello five times!'}
add_space
5.times { |x| puts x}
add_space

#upto
3.upto(9) {|x| puts x}
add_space

#inject - each itr of the block the last line of the block is assigned to the first block param
inject_1 = [1,"a",Object.new,:hi].inject({}) do |hash, item|
  hash[item.to_s] = item
  hash
end
print inject_1
add_space
inject_2 = [1,2,3,4].inject(0) {|total, e| total + e}
print "[1,2,3,4].inject(0) {|total, e| total + e} => #{inject_2}"
add_space


#map - same as collect method
temp = [1,2,3].map { |e| e*2 }
print "[1,2,3].map { |e| e*2 } => #{temp}"
add_space

#find_all
print [1,2,3,4,5].find_all {|x| x < 4}
add_space

#delete_if
d = [1,2,3,4,5,6,7,8,9,10].delete_if { |e| e % 2 == 0 }
print d
add_space

#reject
r = [1,2,3,4,5,6,7,8,9,10].reject { |e| e % 2 == 0 }
print r
add_space
#difference is that if reject! does not change the array,
# it returns nil. delete_if will return the unchanged array.

#select
#extarct even numbers from array into new Array
even_only = [1,2,3,4,5,6,7,8,9].select { |e| e%2 == 0 }
print even_only
