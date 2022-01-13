extends Node2D

var tileList = [0, 0]
var colors = [Color(1.0,0.0,0.0),Color(1.0,0.3,0.0)]
var frame = [Rect2(Vector2(50,50),Vector2(200,200)),Rect2(Vector2(150,200),Vector2(200,200))]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	update()


func _draw():
	print_debug("attempting draw")
	for i in range(tileList.size()):
		draw_rect(frame[i], colors[i])
	pass
