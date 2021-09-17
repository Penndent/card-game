extends Node2D

var board_matrix = []

#Dictionary containing different states of a tile
const board_data = {
	onFire = false,
	onFire_dmg = 0,
	left_onFire = 0, #Remaining Turns to be on fire
	passable = true,
	king_zone = false,
	card_position = Vector2(0,0), 
}

#Creating Board 10 x 10 + Assigning it data
func create_board_matrix():
	for x in range(10):
		board_matrix.append([])
		for y in range(10):
			board_matrix[x].append(board_data.duplicate())
			#Assigning global position for card to take in
			board_matrix[x][y].card_position = Vector2(x * 50, y * 50)

func _ready():
	create_board_matrix()
	#OH YEAH BABY IT WORKS
	print(board_matrix[0][1].card_position)


