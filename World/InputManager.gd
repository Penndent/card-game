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
			move(tile_id)
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
	requiredTiles += 1

func move(event_position):
	if check_tiles() != true:
		return
	
	#Board Data changes
	Board.baord_matrix[tileArray[1]].unit = Board.board_matrix[tileArray[0]].unit
	Board.baord_matrix[tileArray[1]].unit_exists = true
	Board.baord_matrix[tileArray[0]].unit_exists = false
	Board.board_matrix[tileArray[0]].unit = null
	
	#TODO Move Cards Around
	tileArray.clear()

#Checks required Tiles and if its good, it clears query
func check_tiles():
	if tileArray.size() != requiredTiles:
		return false
	requiredTiles = null
	return true
