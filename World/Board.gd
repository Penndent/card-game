extends Node2D

var board_matrix = []
var separation_value = -75
var board_length = 10
var board_width = 10

var adjacency_list = []

#Dictionary containing different states of a tile
const board_data = {
	onFire = false,
	onFire_dmg = 0,
	left_onFire = 0, #Remaining Turns to be on fire
	passable = true,
	king_zone = false,
	card_position = Vector2(0,0), 
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
			
		

func create_pentagon_matrix():
	
	
	pass

func _ready():
	create_board_matrix()
	#OH YEAH BABY IT WORKS
	print(board_matrix[0][1].card_position)


