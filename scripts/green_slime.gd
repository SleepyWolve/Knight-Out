extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	elif ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	position.x += direction * 60 * delta
