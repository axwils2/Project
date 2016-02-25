module Mastermind
	def start_game1 (name)
		name = @name
		puts "Alright #{@name}. I will create a 4 digit code from the letters A through E."
		puts "The letters can be in any order and there could be duplicates"
		puts "Feedback will be given as follows after each turn:"
		puts "An 'X' means a letter is in the code, but you have it in the wrong position."
		puts "An 'O' means a letter is in the code, and you have it in the correct position."
		puts "A '-' means there are no more letters in the code."
		puts "You will have 10 guesses to figure it out!"
		puts "Let's Begin! Type in your guess."
		code_letters = ('A'..'E').to_a
		@secret_code = []
		counter = 0
		while counter < 4
			index = rand (0..4)
			@secret_code.push (code_letters[index])
			counter += 1
		end

		#delete later
		# print @secret_code
		puts " "
		counter2 = 0
		@guesses = []
		@feedback = []
		while counter2 < 10
			game_play
			print @feedback
			puts " "
			if @secret_code == @guesses
				puts "You guessed the code!"
				play_again
				break
			end
			@feedback = []
			@guesses = []
			counter2 += 1
		end
		puts "Sorry, but you did not guess the code. It was #{@secret_code}"
		play_again
	end

	def game_play
		guess = gets.chomp.upcase
		counter3 = 0
		while counter3 < 4
			@guesses.push(guess[counter3])
			counter3 +=1
		end
		
		counter4 = 0
		while counter4 < 4
			if @guesses[counter4] == @secret_code[counter4]
				@feedback.push("O")
			elsif @secret_code.include?(@guesses[counter4]) == false
				@feedback.push("-")
			elsif @secret_code.include?(@guesses[counter4]) == true
				@feedback.push("X")
			end
			counter4 += 1
		end
	end

	def play_again
		puts "Would you like to play again? Yes or No:"
			answer2 = gets.chomp.upcase
			if answer2 == "YES"
				puts "Excellent!"
				start_game1 (@name)
			elsif answer2 == "NO"
				@count = 1
			else
				puts "Sorry, but I don't understand your answer. Guess we will just sign you out!"
			end
	end
end
