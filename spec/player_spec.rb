require 'player'

describe Player do
	let(:coordinates) {double :coordinates}
	let(:board) {double :board}
	let(:player) {Player.new(board)}

	it 'intializes with a board' do
		expect(player).to have_board
	end

	it 'shoots at the opponents board' do
		opponent_board = double :board
		opponent = Player.new(opponent_board)
		expect(opponent_board).to receive(:shoot_at).with(:A1)
		player.shoot_at(opponent, :A1)

	end

	it 'can place a ship' do
		ship = double :ship
		expect(board).to receive(:place).with(ship)
		player.place(ship)
	end
end