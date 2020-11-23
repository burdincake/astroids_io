extends TextEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var scene = preload("res://samsungplay/Astroid_GUI1.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if get_line(0) == "":
		global.buttonPressed = false
	
	if global.buttonPressed == true:

		get_tree().get_root().add_child(scene)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
