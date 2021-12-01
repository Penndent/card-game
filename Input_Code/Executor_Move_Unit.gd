extends "res://Input_Code/Executor_Base.gd"

class_name Executor_Move_Unit

func _init(hist, scheme, n_scheme):
	input_piece_history = hist
	current_scheme = scheme
	next_scheme = n_scheme
	pass
	
func execute():
	print("BEEP BEEP BOOP BOOP MOVING UNITS")

	
	var fromX = input_piece_history[0].node.x
	var fromY = input_piece_history[0].node.x
	var toX = input_piece_history[0].node.y
	var toY = input_piece_history[0].node.y
	
	# can be wrapped into a function somewhere else
		#Board Data changes
	Board.board_matrix[toX][toY].unit = Board.board_matrix[fromX][fromY].unit
	Board.board_matrix[toX][toY].unit_exists = true
	Board.board_matrix[fromX][fromY].unit_exists = false
	
		#Weird Pointer stuff
	Board.board_matrix[fromX][fromY].unit = ''
	
	Board.board_matrix[toX][toY].unit.global_position = Board.board_matrix[toX][toY].card_position
	
	pass
	
