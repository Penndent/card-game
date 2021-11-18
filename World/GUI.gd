extends CanvasLayer

onready var inputManager = get_node('/root/World/InputManager')


func _on_move_Button_pressed():
	inputManager.change_state(0)


func _on_attack_Button_pressed():
	inputManager.change_state(1)


func _on_ability_Button_pressed():
	inputManager.change_state(2)
