extends "res://Input_Code/Input_Scheme_Base.gd"

class_name Input_Scheme_Unit


func _init(hist):
	input_piece_history = hist
	status_message = "Choose an action for this unit"
	pass

func process_piece(input_piece):
	#DECIDE NEXT INPUT SCHEME
	var next_input_scheme = null
	
	
	#CALL EXECUTORS
	var exes = []
	exes.append(Executor_Status.new(input_piece_history, self, next_input_scheme))
	return Scheme_Output.new(null, exes);
