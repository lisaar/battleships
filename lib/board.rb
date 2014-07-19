class Board
	WATER = '~'
	SHIP = 'S'
	HIT = 'x'
	MISS = 'o'

	attr_reader :grid, :rows, :columns
	def initialize(ships = [])
		@columns = ('A'..'J').to_a
		@rows = (1..10).to_a
		@grid = create_hash_of_coordinates(@rows, @columns)
		@ships = ships
	end


	

	def has_ships?
		@ships.any?
	end

	def get_ship_at coordinate
		@ships.select { |ship| ship.coordinates.include?(coordinate)}.first
	end

	

	def shoot_at coordinate
		raise '#{coordinate.to_s} is not a valid shot' if invalid_shot? (coordinate) 
		ship = get_ship_at coordinate
		return mark_hit_shot_at ship, coordinate if grid[coordinate] == SHIP 
		mark_missed_shot_at coordinate
	end

	def place(ship)
		ship.coordinates.each { |coordinate| grid[coordinate] = SHIP}
		@ships << ship
	end

	def mark_missed_shot_at coordinate
		grid[coordinate] = MISS
	end

	def mark_hit_shot_at ship, coordinate
		ship.shoot_at coordinate 
		grid[coordinate] = HIT
	end


	def invalid_shot? coordinate
		!(grid.keys.include? coordinate) || (grid[coordinate] == HIT) || (grid[coordinate] == MISS)
	end




	private


	def create_hash_of_coordinates(row, column)
		coordinates = column.product(row).map { |element| element.join.to_sym}
		Hash[coordinates.map{|coordinate| [coordinate, WATER] } ]
	end



end