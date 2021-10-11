extends "res://Input_Code/Management/Input_Scheme_Base.gd"

class_name Input_Scheme_Start

const IS_Unit = preload("res://Input_Code/Input_Scheme_Unit.gd")


func _init(hist):
	input_piece_history = hist
	status_message = "Start"
	pass

func process_piece(input_piece):
	var hist_copy = input_piece_history.duplicate()
	hist_copy.append(input_piece)
	var next_input_scheme = IS_Unit.new(hist_copy)
	var exes = []
	exes.append(Executor_Status.new(input_piece_history, self, next_input_scheme))
	return Scheme_Output.new(null, exes);

