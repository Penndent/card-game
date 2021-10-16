extends Node

enum {
	MOVE,
	ATTACK,
	ABILITY
}

var state = MOVE
var tileArray = [] #Tiles used for specific Action
var requiredTiles = null

func decide_input(tile_id):
	take_input(tile_id)
	match state:
		MOVE:
			requiredTiles = 2
			move()
		ATTACK:
			pass
		ABILITY:
			pass

#Queries
func take_input(tile_id):
	if requiredTiles != null:
		if tileArray.size() >= requiredTiles:
			return
	tileArray.push_back(tile_id)

func move():
	if check_tiles() != true:
		return
	
	var moving_unit = Board.board_matrix[tileArray[0].x][tileArray[0].y].unit
	#Board Data changes
	Board.board_matrix[tileArray[1].x][tileArray[1].y].unit = moving_unit
	Board.board_matrix[tileArray[1].x][tileArray[1].y].unit_exists = true
	Board.board_matrix[tileArray[0].x][tileArray[0].y].unit_exists = false
	
	Board.board_matrix[tileArray[0].x][tileArray[0].y].unit = null
	
	Board.board_matrix[tileArray[1].x][tileArray[1].y].unit.global_position = Board.board_matrix[tileArray[1].x][tileArray[1].y].card_position
	
	#TODO Move Cards Around
	tileArray.clear()

#Checks required Tiles and if its good, it clears query
func check_tiles():
	if tileArray.size() != requiredTiles:
		return false
	requiredTiles = null
	return true
