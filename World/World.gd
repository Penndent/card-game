extends Node2D

const Basic_card = preload("res://Cards/Card.tscn")
const archer_card = preload("res://Cards/Archer.tscn")
const knight_card = preload("res://Cards/Knight.tscn")
const witch_card = preload("res://Cards/Witch.tscn")

const card_index = {
	'archer': archer_card,
	'knight': knight_card,
	'witch': witch_card
}
const card_ref = ['archer', 'knight', 'witch']


onready var inputManager = get_node('/root/World/InputManager')
onready var board = Board.board_matrix
onready var player_node = $Players
onready var unit_node = $Units
onready var gui = $GUI

signal end_turn

var player_one_points = 0
var player_two_points = 0

var turn = 1
var player_turn = 1


func _ready():
	randomize()
	for x in board.size():
		for y in board[x].size():
			put_card(board[x][y].card_position)
	#link_node_to_board(0, 2, $TempSprite)
	connect('end_turn', unit_node, 'check_conditions_for_turn')
	put_initial_cards()
#Expects Input from GUI to change Turn!
func end_turn():
	turn += 1
	inputManager.tileArray.clear()
	if player_turn > 1:
		player_turn -= 1
		for x in player_node.sUnits.values():
			x.command_list.clear()
	else:
		player_turn += 1
		for x in player_node.fUnits.values():
			x.command_list.clear()
	emit_signal('end_turn')
	
	#USE FOR SINGLE POINT VICTORY ZONE
	var vic = Board.victory_zone
	var vic_board = Board.board_matrix[vic.x][vic.y]
	if vic_board.unit_exists == true:
		vic_board.unit.add_victory()
		print('victory added!')



func put_card(card_pos):
	var basic_card = Basic_card.instance()
	#self.add_child(basic_card)
	basic_card.global_position = card_pos;
	

#TODO implement signals to link these things
func link_node_to_board_vector(board_position, node):
	var x = board_position.x
	var y = board_position.y
	Board.board_matrix[x][y].unit = node
	Board.board_matrix[x][y].unit_exists = true
	#print(Board.board_matrix[x][y].unit)

func link_node_to_board(x, y, node):
	Board.board_matrix[x][y].unit = node
	Board.board_matrix[x][y].unit_exists = true
	node.global_position = Board.board_matrix[x][y].card_position
	#print(Board.board_matrix[x][y].card_position)

func create_random_pool():
	var pool = []
	for x in 3:
		var card_pool = card_ref.duplicate()
		card_pool.shuffle()
		var cardinPool = card_pool.pop_back()
		pool.append(cardinPool)
	
	return pool

func put_initial_cards():
	var cards = create_random_pool()
	for x in 3:
		var Card = card_index[cards[x]].instance()
		unit_node.add_child(Card)
		player_node.fUnits[x] = Card
		Card.send_self(x + 3, 0)
	cards = create_random_pool()
	for x in 3:
		var Card = card_index[cards[x]].instance()
		unit_node.add_child(Card)
		player_node.sUnits[x] = Card
		Card.send_self(x + 3, 9)
		Card.stats.player = 2
