extends Button

var tile_id 
onready var input_manager = get_parent().get_parent()

func _on_Clicky_pressed():
	input_manager.decide_input(tile_id)
