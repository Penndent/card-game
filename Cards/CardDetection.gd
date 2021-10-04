extends Area2D

signal clicked(position)
onready var input_manager = get_parent()

func _ready():
	self.connect("clicked", input_manager, "move")

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 && event.pressed == true:
			emit_signal("clicked", event.position)

