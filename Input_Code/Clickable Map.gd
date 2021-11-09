extends Node2D

var ind_button = preload("res://Input_Code/Clicky.tscn")

func _ready():
	for x in range(Board.board_width):
		for y in range(Board.board_length):
			instance_button(Board.board_matrix[x][y].card_position, x, y)

func instance_button(instance_position, x, y):
	var Ind_Button = ind_button.instance()
	call_deferred('add_child', Ind_Button)
	var subtract = 65/2
	Ind_Button.set_global_position(instance_position - (Vector2(subtract,subtract)))
	
	Ind_Button.tile_id = Vector2(x, y)
