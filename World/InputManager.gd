extends Node

enum {
	MOVE,
	ATTACK,
	ABILITY
}

var state = MOVE
var tileArray = []
var requiredTiles = null
var tile = null
var tileTwo = null

func decide_input(tile_id):
	take_input(tile_id, state)
	match state:
		MOVE:
			requiredTiles = 2
			move(tile_id)

#Queries
func take_input(tile_id, state):
	if tileArray != null:
		if tileArray.size() >= requiredTiles:
			return
	tileArray.push_back(tile_id)

func move(event_position):
	check_tiles()
	#TODO - Does Board Action/Calls Function

#Checks required Tiles and if its good, it clears query
func check_tiles():
	if tileArray.size() != requiredTiles:
		return
	tileArray.clear()
	requiredTiles = null
