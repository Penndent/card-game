extends "res://Input_Code/Executor_Base.gd"

class_name Executor_Status

func _init(hist, scheme, n_scheme):
	input_piece_history = hist
	current_scheme = scheme
	next_scheme = n_scheme
	pass
	
func execute():
	print("Showing a status")
	if(next_scheme != null):
		print("STATUS: " + next_scheme.status_message)
	pass
