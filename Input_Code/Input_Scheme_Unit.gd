extends "res://Input_Code/Input_Scheme_Base.gd"

class_name Input_Scheme_Unit

const IS_Unit_Tile = preload('res://Input_Code/Input_Scheme_Unit_Tile.gd')

func _init():
	status_message = "Choose a destination tile for this unit"
	pass

func process_piece(new_piece, history):
	#DECIDE NEXT INPUT SCHEME
	var next_input_scheme = IS_Unit_Tile.new()
	
	#CALL EXECUTORS
	var exes = []
	exes.append(Executor_Status.new(history, self, next_input_scheme))
	return Scheme_Output.new(next_input_scheme, exes);
