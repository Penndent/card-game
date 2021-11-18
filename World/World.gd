extends Node2D

var Basic_card = preload("res://Cards/Card.tscn")
onready var board = Board.board_matrix

var player_one_points = 0
var player_two_points = 0

var turn = 1
var player_turn = 1


func _ready():
	for x in board.size():
		for y in board[x].size():
			put_card(board[x][y].card_position)
	#link_node_to_board(0, 2, $TempSprite)

#Expects Input from GUI to change Turn!
func end_turn():
	turn += 1
	if player_turn > 1:
		player_turn -= 1
	else:
		player_turn += 1
	
	#USE FOR SINGLE POINT VICTORY ZONE
	var vic = Board.victory_zone
	if Board.board_matrix[vic.x][vic.y].unit_exists == true:
		Board.board_matrix[vic.x][vic.y].unit.add_victory



func put_card(card_pos):
	var basic_card = Basic_card.instance()
	#self.add_child(basic_card)
	basic_card.global_position = card_pos


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
	print(Board.board_matrix[x][y].card_position)
