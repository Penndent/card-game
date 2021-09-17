extends Node2D

const stats = {
	health = 10,
	attack_dmg = 5,
	movement = 2,
}

func _ready():
	global_position = Board.board_matrix[0][1].card_position
