extends Node2D

var ind_button = preload("res://Input_Code/Clicky.tscn")

func _ready():
	for x in range(Board.board_width):
		for y in range(Board.board_length):
			instance_button(Board.board_matrix[x][y].card_position)
			print('h')

func instance_button(instance_position):
	var Ind_Button = ind_button.instance()
	get_parent().call_deferred('add_child', Ind_Button)
	Ind_Button.set_global_position(instance_position)
