class Player

	attr_reader :board

	def initialize(board)
		@board = board
	end

	def has_board?
		@board
	end

	def shoot_at(opponent, coordinate)
		opponent.board.shoot_at(coordinate)
	end

	def place(ship)
		board.place(ship)
	end
end