#toomanyifs
def number_check(num)
	if (num % 20 == 0) && (num % 19 == 0)
		if (num %18 == 0) && (num % 17 == 0)
			if (num %16 == 0) && (num % 15 == 0)
				if (num %14 == 0) && (num % 13 == 0)
					if (num %12 == 0) && (num % 11 == 0)
						if (num %10 == 0) && (num % 9 == 0)
							if (num %8 == 0) && (num % 7 == 0)
								if (num % 6 == 0) && (num % 5 == 0)
									if (num % 4 == 0) && (num % 3 == 0)
										if (num % 2== 0)
											puts "the number is #{num}"
											exit
										else
											puts "who knows"
											exit
										end
									else
										number_check(num + 20)
									end
								else
									number_check(num + 20)
								end
							else
								number_check(num + 20)
							end	
						else
							number_check(num + 20)
						end	
					else
						number_check(num + 20)
					end						
				else
					number_check(num + 20)
				end	
			else
				number_check(num + 20)
			end					
		else
			number_check(num + 20)
		end
	else
		number_check(num + 20)
	end
end

number_check(20)