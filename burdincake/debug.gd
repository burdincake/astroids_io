extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
		set_text("pointer: " +str(get_local_mouse_position())+"\n"+"PlayerName: "+str(global.playerName))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
