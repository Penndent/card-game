extends Node

var xconstraintleft = -50
var xconstraintright = 50
var yconstraintup = -150
var yconstraintdown = 150

func _ready():
	pass # Replace with function body.


func _process(delta):
	var xfactor = 0;
	var yfactor = 0;
	if Input.is_action_pressed("ui_left"):
		xfactor -= 1;
	if Input.is_action_pressed("ui_right"):
		xfactor += 1;
	if Input.is_action_pressed("ui_up"):
		yfactor -= 1;
	if Input.is_action_pressed("ui_down"):
		yfactor += 1;
	
	if abs(xfactor) > 0.5 && abs(yfactor) > 0.5:
		xfactor *= 0.707;
		yfactor *= 0.707;
	
	var speed = 10;
	var xspeed = xfactor * speed
	var yspeed = yfactor * speed
	
	self.position += Vector2(xspeed, yspeed)
	
	if self.position.x < xconstraintleft:
			self.position.x = xconstraintleft
	if self.position.x > xconstraintright: 
			self.position.x = xconstraintright
	if self.position.y < yconstraintup:
			self.position.y = yconstraintup
	if self.position.y > yconstraintdown: 
			self.position.y = yconstraintdown

	#print_debug("CAMERA")
	#print_debug(self.position)
	
	

	
