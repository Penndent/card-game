extends "res://Input_Code/Input_Scheme_Base.gd"

class_name Input_Scheme_Start

const IS_Unit = preload("res://Input_Code/Input_Scheme_Unit.gd")


func _init():
	status_message = "Start"
	pass

func process_piece(new_piece, history):
	var next_input_scheme = IS_Unit.new()
	var exes = []
	exes.append(Executor_Status.new(history, self, next_input_scheme))
	return Scheme_Output.new(next_input_scheme, exes);

