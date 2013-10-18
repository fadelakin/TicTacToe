# Tic Tac Toe
# Temidayo Fisher Adelakin
class TicTacToe

	def initialize
		# Container to hold the 9 places on the tic tac toe board
		# 3 x 3 grid. A,B,C across, 1,2,3 down
		@places = {
			"a1"=>" ", "a2"=>" ","a3"=>" ",
			"b1"=>" ", "b2"=>" ", "b3"=>" ",
			"c1"=>" ", "c2"=>" ", "c3"=>" "
		}

		# 8 different possible winning columns
		@columns = [
			['a1', 'a2', 'a3'],
			['b1', 'b2', 'b3'],
			['c1', 'c2', 'c3'],
			['a1', 'b1', 'c1'],
			['a2', 'b2', 'c2'],
			['a3', 'b3', 'c3'],
			['a1', 'b2', 'c3'],
			['c1', 'b2', 'a3']
		]

		# Randomly determine who is X and who is O.
		@cpu = rand() > 0.5 ? 'X' : 'O'
		@user = @cpu == 'X' ? 'O' : 'X'

		# Ask user for name
		@cpu_name = "Hal"
		put_line
		puts " TIC TAC TOE"
		puts " What is your name?"
		STDOUT.flush
		@user_name = gets.chomp
		put_bar

		if(@user == 'X')
			user_turn
		else
			cpu_turn
		end
	end

	def put_line
		puts "-----------------------------------------------------------------------------"
	end

	def put_bar
		puts "#############################################################################"
  		puts "#############################################################################"
  	end