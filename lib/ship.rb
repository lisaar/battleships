class Ship

	def initialize(coordinates)
		@coordinates = coordinates
		@hits = []
	end

	def has_coordinates?
		@coordinates.any?
	end

	def length
		@coordinates.count
	end

	def shoot_at(coordinate)
		@hits << coordinate
		self
	end

	def has_hits?
		@hits.any?
	end

	def sunk?
		 @hits.length == length
	end
end