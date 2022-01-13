extends Node2D


var xconstraintleft = -900
var xconstraintright = 900
var yconstraintup = -540
var yconstraintdown = 580


var minzoom = 0.5
var maxzoom = 2

var seizureCounter = 0
var prevCorrection

func _ready():
	pass



func _process(delta):
	update()
	var oPos = self.position
	var oZoom = $Camera2D.zoom
	
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
		
	var mspeed = 450;
	var xspeed = xfactor * mspeed * delta
	var yspeed = yfactor * mspeed * delta
	
	var zspeed = 0.8;
	if Input.is_action_pressed("cam_zoom_in"):
		$Camera2D.zoom.x -= zspeed * delta
		$Camera2D.zoom.y -= zspeed * delta
	if Input.is_action_pressed("cam_zoom_out"):
		$Camera2D.zoom.x += zspeed * delta
		$Camera2D.zoom.y += zspeed * delta
	
	if $Camera2D.zoom.x < minzoom:
		$Camera2D.zoom.x = minzoom
		$Camera2D.zoom.y = minzoom
	if $Camera2D.zoom.x > maxzoom:
		$Camera2D.zoom.x = maxzoom
		$Camera2D.zoom.y = maxzoom
	
	self.position += Vector2(xspeed, yspeed)
	
	#ALRIGHT BIG OL CORNER SNAP CODE WOOOOOOO
	var corners = []
	#determine corners of current camera view
	var left = self.position.x - 540 * $Camera2D.zoom.x
	var right = self.position.x + 540 * $Camera2D.zoom.x
	var up = self.position.y - 340 * $Camera2D.zoom.y
	var down = self.position.y + 340 * $Camera2D.zoom.y
	corners.append(Vector2(left, up))
	corners.append(Vector2(right, up))
	corners.append(Vector2(left, down))
	corners.append(Vector2(right, down))
	
	var corrections = []
	for corner in corners:
		#create a "force" on the position for each corner
		var correction = Vector2(0, 0)
		if corner.x <= xconstraintleft:
			correction.x = xconstraintleft-corner.x
		if corner.x >= xconstraintright:
			correction.x = xconstraintright-corner.x
		if corner.y <= yconstraintup:
			correction.y = yconstraintup-corner.y
		if corner.y >= yconstraintdown:
			correction.y = yconstraintdown-corner.y
		if correction.x != 0 || correction.y != 0:
			corrections.append(correction)
			#print_debug("add corner correct")
			#print_debug(correction)
	
	var isShiftAborted = false
	var totalCorrection = Vector2(0, 0)
	for correction in corrections:
		if correction.x != 0:
			if totalCorrection.x == 0:
				totalCorrection.x = correction.x
			#xor, corrections conflict if different signs
			if correction.x * totalCorrection.x < -0.1:
				isShiftAborted = true
			#choose the smaller conflict correction to reduce risk of bugs
			elif abs(correction.x) < abs(totalCorrection.x):
				totalCorrection.x = correction.x
		#same deal for y
		if correction.y != 0:
			if totalCorrection.y == 0:
				totalCorrection.y = correction.y
			if correction.y * totalCorrection.y < -0.1:
				isShiftAborted = true
			elif abs(correction.y) < abs(totalCorrection.y):
				totalCorrection.y = correction.y
	
	#if null instantiate with w/e
	
	if !prevCorrection:
		prevCorrection = totalCorrection
	if corrections.size() == 0:
		seizureCounter = 0
	else:
		var moreSeizures = 0
		if prevCorrection.y * totalCorrection.y < -0.1:
			moreSeizures += 1
		elif prevCorrection.x * totalCorrection.x < -0.1:
			moreSeizures += 1
		if moreSeizures != 0:
			seizureCounter += moreSeizures
		else:
			seizureCounter = 0
	
	prevCorrection = totalCorrection
	
	if seizureCounter > 3:
		#print_debug("CALL THE EMTS")
		$Camera2D.zoom.x -= zspeed*delta
		$Camera2D.zoom.y -= zspeed*delta
		if $Camera2D.zoom.x < minzoom:
			$Camera2D.zoom.x = minzoom
			$Camera2D.zoom.y = minzoom
		seizureCounter = 0
	
	if isShiftAborted:
		#print_debug("abort camera shift")
		self.position = oPos
		$Camera2D.zoom = oZoom
	else:
		self.position += totalCorrection

	#print_debug("CAMERA")
	#print_debug(self.position)
	
	
func _draw():

	#THESE BOUNDS ARE JUST FOR REFERENCE
	#THE HOPE IS THAT THEY ARE INVISIBLE TO THE CAM IN ACTUAL GAME

	var os = 5; #positive for outside field of view, neg for inside
	var topleft = Vector2(xconstraintleft-os, yconstraintup-os)
	var topright = Vector2(xconstraintright+os, yconstraintup-os)
	var botleft = Vector2(xconstraintleft-os, yconstraintdown+os)
	var botright = Vector2(xconstraintright+os, yconstraintdown+os)
	topleft = topleft - self.position;
	topright = topright - self.position;
	botleft = botleft - self.position;
	botright = botright - self.position;
	
	var color = Color(1, 0, 0.5)
	draw_circle(topleft, 10, color)
	draw_circle(topright, 10, color)
	draw_circle(botleft, 10, color)
	draw_circle(botright, 10, color)
	
	#draw_circle(Vector2(510, 340), 30, Color(1, 1, 0))
	#draw_circle(Vector2(510, 340), 10, Color(0, 0.6, 1))
	
