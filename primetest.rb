#primetest
# http://ruby-doc.org/stdlib-1.9.3/libdoc/prime/rdoc/Prime.html
require 'prime'

puts "please type the largest value you want there to be a prime"
large_prime = gets.chomp.to_i

Prime.each(large_prime) do |num|
	print "#{num}, "
end