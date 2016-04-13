#project Euler mutliples of 3 and 5
n = 1
target = 1000
tally = 0
until n >= target do
	if (n%3 == 0) || (n%5 == 0)
		tally += n
		n += 1
	else
		n += 1
	end
end
print tally