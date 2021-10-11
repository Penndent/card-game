const Input_Scheme_Start = preload("res://Input_Code/Input_Scheme_Start.gd")

var active_input_scheme

#MASTER INPUT ROUTE FUNCTION: ALL CLICKS GO TO PROCESS_INPUT
#ACCEPTS AN INPUT PIECE
#There will probably need to be a class to 
#create/route input pieces into this class
#Precondition: There is a valid active input scheme
#Postcondition: Have in place a valid input scheme
#Don't leave dumb stuff like strings in input scheme
func process_input(trigger_action_info):
	var scheme_out = active_input_scheme.process_piece(trigger_action_info);

	for exe in scheme_out.executor_list:
		exe.execute()
	#Detect if an executor class is used, end of scheme
	if scheme_out.next_scheme != null:
		active_input_scheme = scheme_out.next_scheme
	else: 
		active_input_scheme = Input_Scheme_Start.new()
	pass

