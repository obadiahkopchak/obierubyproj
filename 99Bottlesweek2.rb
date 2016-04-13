puts "Welcome to the drinking dome"
puts "How many bottles of beer are on the wall?"
puts "(Please type numbers like 1, 2, 7905, not words)"
bottle_count=gets.chomp.to_i

while bottle_count > 0 do
puts "#{bottle_count} bottles of beer on the wall"
puts "#{bottle_count} bottles of beer"
puts "take one down pass it around"
bottle_count -= 1
puts "#{bottle_count} bottles of beer"
end