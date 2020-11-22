extends Button

const textedit = preload("res://burdincake/textfile.tscn")
# Declare member variables here. Examples:
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var textedit1 = textedit.instance()
	print(textedit.a)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
