extends "res://Input_Code/Input_Scheme_Base.gd"

class_name Input_Scheme_Unit_Tile


func _init():
	status_message = "Moving unit..."
	pass

func process_piece(new_piece, history):

	var exes = []
	exes.append(Executor_Move_Unit.new(history, self, null))
	return Scheme_Output.new(null, exes);
