extends Node2D

var board_matrix = []
var separation_value = -75
var board_length = 10
var board_width = 10
var victory_zone

var adjacency_list = []

#Dictionary containing different states of a tile
const board_data = {
	onFire = false,
	onFire_dmg = 0,
	left_onFire = 0, #Remaining Turns to be on fire
	passable = true,
	king_zone = false,
	card_position = Vector2(0,0), 
	unit_exists = false, #IS there a unit on piece 
	unit = null, #Link to specific Unit
	on = true, #For Pentagonal Shape
}

#Creating Board 10 x 10 + Assigning it data
func create_board_matrix():
	for x in range(board_width):
		board_matrix.append([])
		for y in range(board_length):
			board_matrix[x].append(board_data.duplicate())
			#Assigning global position for card to take in
			board_matrix[x][y].card_position = Vector2(x * separation_value + 350, y * separation_value + 350)

	for x in range(board_width):
		for y in range(board_length):
			var thiscellID = 10*x+y
			var adjacent_cells = [thiscellID + 1, thiscellID - 1, thiscellID + board_width, thiscellID - board_width]
			var adjacent_filtered = []
			for adj in adjacent_cells:
				if(adj >= 0 && adj < board_width * board_length):
					adjacent_filtered.append(adj)
			adjacency_list.append([adjacent_filtered])
			
		

#Single point victory zone
func create_victory_zone():
	var one_point = Vector2(board_width / 2, board_length / 2)
	print(one_point)
	victory_zone = one_point
	board_matrix[one_point.x][one_point.y].king_zone = true


func _ready():
	create_board_matrix()
	create_victory_zone()


