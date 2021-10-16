extends Node2D

signal send_self(x, y, itself)
onready var root_node = get_node("/root/World")
onready var input_node = get_node("/root/World/InputManager")

func _ready():
	connect("send_self", root_node, "link_node_to_board")
	send_self(0,0)

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		input_node.decide_input(Vector2(0,0))
		input_node.decide_input(Vector2(5,5))

const stats = {
	health = 10,
	attack_dmg = 5,
	movement = 2,
	pass_thru = false,
}

func get_new_unit():
	return stats.duplicate()
func send_self(x, y):
	emit_signal("send_self", x, y, self)

