extends Node2D

var Basic_card = preload("res://Cards/Card.tscn")
onready var board = Board.board_matrix

func _ready():
	for x in board.size():
		for y in board[x].size():
			put_card(board[x][y].card_position)
	#link_node_to_board(0, 2, $TempSprite)

func put_card(card_pos):
	var basic_card = Basic_card.instance()
	#self.add_child(basic_card)
	basic_card.global_position = card_pos


#TODO implement signals to link these things
func link_node_to_board_vector(board_position, node):
	var x = board_position.x
	var y = board_position.y
	Board.board_matrix[x][y].unit = node
	#print(Board.board_matrix[x][y].unit)

func link_node_to_board(x, y, node):
	Board.board_matrix[x][y].unit = node
	#print(Board.board_matrix[x][y].unit)
