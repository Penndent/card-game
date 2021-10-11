#THIS IS A PARENT CLASS FOR ALL SCHEMES
class_name Input_Scheme_Base

const Scheme_Output = preload("res://Input_Code/Scheme_Output.gd")

#globally important executors
const Executor_Cancel = preload("res://Input_Code/Executor_Cancel.gd")
const Executor_Status = preload("res://Input_Code/Executor_Status.gd")

var input_piece_history
var status_message

	
#Returns a Scheme Output
func process_piece(input_piece):
	return self

