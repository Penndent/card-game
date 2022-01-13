extends Control


func _on_Start_Button_pressed():
	get_tree().change_scene("res://World/World.tscn")
	pass

func _on_Quit_Button_pressed():
	get_tree().quit()
	
func _on_Button_pressed():
	get_tree().change_scene("res://Menu/Credits.tscn")
	
