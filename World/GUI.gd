extends CanvasLayer

onready var inputManager = '/root/InputManager'


func _on_move_Button_pressed():
	inputManager.change_state(0)
