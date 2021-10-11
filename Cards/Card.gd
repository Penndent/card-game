extends Node2D


const stats = {
	health = 10,
	attack_dmg = 5,
	movement = 2,
	pass_thru = false,
}

func get_new_unit():
	return stats.duplicate()
