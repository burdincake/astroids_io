extends Node2D

var x = rand_range(-1000,1000)
var y = rand_range(-1000,1000)
var rad = 2
var dist = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _draw():
	draw_circle(Vector2(x,y),rad,Color(3,3,3))
