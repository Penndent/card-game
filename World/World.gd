extends Node2D

var Basic_card = preload("res://Cards/Card.tscn")
onready var board = Board.board_matrix

func _ready():
	for x in board.size():
		for y in board[x].size():
			put_card(board[x][y].card_position)

func put_card(card_pos):
	var basic_card = Basic_card.instance()
	self.add_child(basic_card)
	basic_card.global_position = card_pos
