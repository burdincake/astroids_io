extends KinematicBody2D
var velocity = Vector2()
export var accel_speed = 75.0
export var decel_speed = 0.45
export var max_horizontal_velocity = 100.0
export var max_vertical_velocity = 100.0
export var angular_velocity = 0.0005
var is_accel = false
var collision_particle = preload('res://samsungplay/astroid_particle.tscn')



# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _physics_process(delta):
	
	is_accel = false
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += delta * accel_speed
		is_accel = true
		
		
	if Input.is_action_pressed('ui_left'):
		velocity.x -= delta * accel_speed
		is_accel = true
	if Input.is_action_pressed('ui_down'):
		velocity.y += delta * accel_speed
		is_accel = true
	if Input.is_action_pressed('ui_up'):
		velocity.y -= delta * accel_speed
		is_accel = true
	if not is_accel:
		velocity.x = lerp(velocity.x,0,decel_speed * delta)
		velocity.y = lerp(velocity.y,0,decel_speed*delta)	
	if velocity.x > 0:
		velocity.x = min(velocity.x,max_horizontal_velocity)
	
	else:
		velocity.x = max(velocity.x,-max_horizontal_velocity)
		
	if velocity.y > 0:
		velocity.y = min(velocity.y,max_vertical_velocity)
	else:
		velocity.y = max(velocity.y,-max_vertical_velocity)
	rotate(velocity.x * angular_velocity)
	rotate(velocity.y * angular_velocity)
	
	
	global.velocity = velocity
	global.playerPosition = self.position
	move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if body != self:
		emit_particle()
		
func emit_particle():
	var particleInstance = collision_particle.instance()
	particleInstance.set('gravity',Vector2(-velocity.x,-velocity.y))
	particleInstance.set('speed_scale',velocity.length()/5.0)
	add_child(particleInstance)
	yield(get_tree().create_timer(2.0),'timeout')
	particleInstance.queue_free()
