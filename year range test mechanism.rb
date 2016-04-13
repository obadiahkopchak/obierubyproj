#year range test mechanism
puts "please provide a maximum number for our random number generator"
user_input = gets.chomp.to_i
puts "great our range is between 1 and #{user_input}"
puts rand(1..user_input)
puts "now you are testing whether you can add in your text output"
puts "here we are adding a random number to seven that value is #{7+rand(1..user_input)}"
