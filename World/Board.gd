extends Node2D

var board_matrix = []

#Dictionary containing different states of a tile
const board_data = {
	onFire = false,
	onFire_dmg = 0,
	passable = true,
}

#Creating Board 10 x 10
func create_board_matrix():
	for x in range(10):
		board_matrix.append([])
		for y in range(10):
			board_matrix[x].append(board_data.duplicate())

func _ready():
	create_board_matrix()
	#OH YEAH BABY IT WORKS
	print(board_matrix[0][1].passable)


