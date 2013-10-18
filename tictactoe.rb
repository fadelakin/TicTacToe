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

  	# Draw the tic tac toe board
  	def draw_game
  		puts ""
  		puts "#{@cpu_name}: #{@cpu}"
  		puts "#{@user_name}: #{@user}"
  		puts ""
  		puts "		a b c"
  		puts ""
  		puts " 1 #{@places["a1"]}|#{@places["b1"]}|#{@places["c1"]}"
  		puts "   -----"
  		puts " 2 #{@places["a2"]}|#{@places["b2"]}|#{@places["c2"]}"
  		puts "   -----"
  		puts " 3 #{@places["a3"]}|#{@places["b3"]}|#{@places["c3"]}"
  	end

  	def cpu_turn
  		move = cpu_find_move
  		@places[move] = @cpu
  		put_line
  		puts "#{@cpu_name} marks #{move.upcase}"
  		check_game(@user)
  	end

  	def times_in_column arr, item
  		times = 0
  		arr.each do |i|
  			times += 1 if @places[i] == item
  			unless @places[i] == item || @places[i] == " "
  				# opposite piece is in column so column can't be used to win.
  				# so the thing to do is choose a different column so return 0
  				return 0
  			end
  		end
  		times
  	end

  	def empty_in_column arr
  		arr.each do |i|
  			if @places[i] == " "
  				return i
  			end
  		end
  	end

	def cpu_find_move
	  @columns.each do |column|
	  	if times_in_column(column, @cpu) == 2
	  		return empty_in_column column
	  	end
	  end

	  	@columns.each do |column|
	  		if times_in_column(column, @user) == 2
	  			return empty_in_column column
	  		end
	  	end

	  	@columns.each do |column|
	  		if times_in_column(column, @cpu) == 1
	  			return empty_in_column column
	  		end
	  	end

	  	#find a random empty spot
	  	k = @places.keys;
	  	i = rand(k.length)
	  	if @places[k[i]] == " "
	  		return k[i]
	  	else
	  		#just find the first empty slot
	  		@places.each { |k,v| return k if v == " " }
	  	end
	end

	def user_turn
	  put_line
	  puts " RUBY TIC TAC TOE"
	  draw_game
	  puts " #{@user_name}, please make a move or type 'exit' to quit"
	  STDOUT.flush
	  input = gets.chomp.downcase
	  put_bar
	  if input.length == 2
	    a = input.split("")
	    if(['a','b','c'].include? a[0])
	      if(['1','2','3'].include? a[1])
	        if @places[input] == " "
	          @places[input] = @user
	          put_line
	          puts "#{@user_name} marks #{input.upcase}"
	          check_game(@cpu)
	        else
	          wrong_move
	        end
	      else
	        wrong_input
	      end
	    else
	      wrong_input
	    end
	  else
	    wrong_input unless input == 'exit'
	  end
	end

	def wrong_input
	  put_line
	  puts "Please specify a move with the format 'A1' , 'B3' , 'C2' etc."
	  user_turn
	end

	def wrong_move
	  put_line
	  puts "You must choose an empty slot"
	  user_turn
	end

	def check_game(next_turn)
  		game_over = nil
		@columns.each do |column|
	    	# see if cpu has won
			if times_in_column(column, @cpu) == 3
	    		put_line
	    		puts "Game Over -- #{@cpu_name} WINS!!!"
	    		game_over = true
	    	end
	    	# see if user has won
	    	if times_in_column(column, @user) == 3
	    		put_line
	      		puts "Game Over -- #{@user_name} WINS!!!"
	      		game_over = true
	    	end
	   	end
	  	unless game_over
	    	if(moves_left > 0)
	      		if(next_turn == @user)
	        		user_turn
	      		else
	        		cpu_turn
	      		end
	    	else
	      		put_line
	      		puts "Game Over -- DRAW!"
	    	end
	  	end
	end

	def moves_left
		slots = 0
		@places.each do |k, v|
			slots += 1 if v == " "
		end
		slots
	end

end