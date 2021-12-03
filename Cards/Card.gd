extends Node2D

signal send_self(x, y, itself)
signal send_card_to_player(itself)
onready var root_node = get_node("/root/World")
onready var input_node = get_node("/root/World/InputManager")
onready var player_node = get_node('/root/World/Players')

var prev_board_position
var curr_board_position

var command_list = []

#TODO SEND UNIT TO PLAYER NODE
func _ready():
	connect("send_self", root_node, "link_node_to_board")
	#print(self)
	player_node.fUnits['1'] = self
	send_self(0,0)

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		input_node.decide_input(Vector2(0,0))
		input_node.decide_input(Vector2(5,5))

const stats = {
	health = 10,
	attack_dmg = 5,
	movement = 3,
	pass_thru = false,
	player = 1,
}

func check_death():
	if stats.health == 0:
		curr_board_position.unit_exists = false
		queue_free()

func add_victory():
	if stats.player == 1:
		root_node.player_one_points += 1
	else:
		root_node.player_two_points += 1

func update_self(x, y):
	prev_board_position = curr_board_position
	curr_board_position = Board.board_matrix[x][y]

func get_new_unit():
	return stats.duplicate()
func send_self(x, y):
	#print('sent ' + str(x) + ' ' + str(y))
	emit_signal("send_self", x, y, self)

