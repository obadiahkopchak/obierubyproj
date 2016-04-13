#Leap Year Challenge
#
#Years divisible by 4 good, 100 bad, 400 good
puts "Welcome to the Leap Year Calculator"
puts "Please type a starting year"
first_year = gets.chomp.to_i
puts "Thank you for providing the year #{first_year}"
puts "Now Please type an end year to use"
last_year = gets.chomp.to_i
puts "We will now calculate how many leap years there were in your range"

actual_year_list = (first_year..last_year).select {|number| number % 4 ==0 && number % 100 != 0 || number % 400 == 0}
puts "There are #{actual_year_list.count} leap years between #{first_year} and #{last_year}"
#puts actual_year_list.count
#actual_year_list.each do |given_year|
#	puts given_year
#end
# this below bit of code is to allow for checking the actual_year_list for actual_year_list
inconsistancies.each do |given_year|
	puts given_year
end


#year_count = 0
#(first_year..last_year).each do |given_year|
#	if given_year 

#	year_count += 1
#puts year_count
#end
