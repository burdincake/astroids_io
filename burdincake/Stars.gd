extends Node

const Star = preload("res://burdincake/star.tscn")

var starCount = 1000



# Called when the node enters the scene tree for the first time.
func _ready():
	for a in starCount:
		var newStar = Star.instance()
		add_child(newStar)
