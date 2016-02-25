require "./mastermind.rb"
require "./connect4.rb"

class Games
	include Mastermind
	include Connect4
	def initialize 
		puts "Welcome to the Game Console! What is your name?"
		@name = gets.chomp
		gaming = 0
		while gaming == 0
			puts "Hey #{@name}! We have two games in the console. Mastermind and Connect Four. Type 'Mastermind', 'Connect Four' or 'Exit':"
			answer = gets.chomp.upcase
			if answer == "MASTERMIND"
				start_game1 (@name)
				puts "Hope you had a good time! Goodbye!"
				gaming = 1
			elsif answer == "CONNECT FOUR"
				g = Game.new
				g.play_main
				puts "Hope you had a good time! Goodbye!"
				gaming = 1
			elsif answer == "EXIT"
				puts "Sorry to see you leave! Maybe next time!"
				gaming = 1
			else
				puts "Sorry, but I don't know that answer. Let's try again!" 
			end
		end
	end
end

new_game = Games.new