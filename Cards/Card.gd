extends Node2D

signal send_self(x, y, itself)
onready var root_node = get_node("/root/World")

func _ready():
	connect("send_self", root_node, "link_node_to_board")
	send_self(0,0)

const stats = {
	health = 10,
	attack_dmg = 5,
	movement = 2,
	pass_thru = false,
}

func send_self(x, y):
	emit_signal("send_self", x, y, self)

