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
			requiredTiles = 2
			attack()
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
	
	var fTile = Board.board_matrix[tileArray[0].x][tileArray[0].y]
	var sTile = Board.board_matrix[tileArray[1].x][tileArray[1].y]
	
	#Board Data changes
	sTile.unit = fTile.unit
	sTile.unit_exists = true
	fTile.unit_exists = false
	
	fTile.unit = null
	sTile.unit.global_position = sTile.card_position
	sTile.unit.update_self()
	
	tileArray.clear()

func attack():
	if check_tiles() != true:
		return
	
	var fTile = Board.board_matrix[tileArray[0].x][tileArray[0].y]
	var sTile = Board.board_matrix[tileArray[1].x][tileArray[1].y]
	
	if fTile.unit_exists == false || sTile.unit_exists == false:
		#TODO Return some sort of "you done wrong, do it again"
		return
	
	var player_dmg = fTile.unit.stats.attack_dmg
	var enemy_health = sTile.unit.stats.health
	
	enemy_health -= player_dmg
	sTile.unit.check_death()
	
	#TODO send s

#Checks required Tiles and if its good, it clears query
func check_tiles():
	if tileArray.size() != requiredTiles:
		return false
	requiredTiles = null
	return true
