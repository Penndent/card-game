extends "res://Cards/Card.gd"

var unit_stats = {
	health = 10,
	attack_dmg = 5,
	movement = 3,
	pass_thru = false,
	player = 1,
}

func _ready():
	stats = unit_stats
