extends Node

onready var world = get_node('/root/World')

enum {
	MOVE,
	ATTACK,
	ABILITY,
	ENDTURN
}

var state = MOVE
var tileArray = [] #Tiles used for specific Action
var requiredTiles = null

func change_state(new_state):
	state = new_state
	tileArray.clear()
	#print(state)

func decide_input(tile_id):
	take_input(tile_id)
	#print(state)
	match state:
		MOVE:
			requiredTiles = 2
			move()
		ATTACK:
			requiredTiles = 2
			attack()
		ABILITY:
			pass
		ENDTURN:
			requiredTiles = 0
			#ADD ENDTURN FUNCTION

#Queries
func take_input(tile_id):
	if requiredTiles != null:
		if tileArray.size() >= requiredTiles:
			return
	tileArray.push_back(tile_id)

func move():
	if input_conditions('move'):
		return
	 
	var fTile = Board.board_matrix[tileArray[0].x][tileArray[0].y]
	var sTile = Board.board_matrix[tileArray[1].x][tileArray[1].y]
	
	var fTileVector = tileArray[0]
	var sTileVector = tileArray[1]
	
	fTile.unit.command_list.push_front('move')
	
	# CHANGES WHERE UNIT EXISTS
	sTile.unit = fTile.unit
	sTile.unit_exists = true
	fTile.unit_exists = false
	
	fTile.unit = null
	sTile.unit.global_position = sTile.card_position
	sTile.unit.update_self(tileArray[1].x, tileArray[1].y)
	
	tileArray.clear()

func attack():
	if input_conditions('attack'):
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
	
	fTile.unit.command_list.push_front('attack')
	tileArray.clear()
	#TODO send s

#Checks required Tiles and if its good, it clears query
func check_tiles():
	if tileArray.size() != requiredTiles:
		return false
	requiredTiles = null
	return true

#For 2 Tile Actions
func input_conditions(dec):
	if check_tiles() != true:
		return true
	
	var fTile = Board.board_matrix[tileArray[0].x][tileArray[0].y]
	var sTile = Board.board_matrix[tileArray[1].x][tileArray[1].y]
	
	var fTileVector = tileArray[0]
	var sTileVector = tileArray[1]
	
	if fTile.unit_exists == false:
		#TODO Visual Teller
		tileArray.clear()
		return true
	
	if fTile == sTile:
		return true
	
	if abs((fTileVector.x - sTileVector.x) + (fTileVector.y - sTileVector.y)) > fTile.unit.stats.movement:
		tileArray.clear()
		print('too much movement!')
		return true
	
	if world.player_turn != fTile.unit.stats.player:
		print('not player')
		return true
	
	if fTile.unit.command_list.has(dec):
		return true
