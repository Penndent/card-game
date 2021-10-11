extends "res://Input_Code/Executor_Base.gd"

class_name Executor_Cancel

func _init(hist, scheme, n_scheme):
	input_piece_history = hist
	current_scheme = scheme
	next_scheme = n_scheme
	pass
	
func execute():
	print("Action Cancelled: task failed successfully")
	pass
