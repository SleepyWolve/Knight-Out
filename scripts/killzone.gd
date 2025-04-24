extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	var player_collision = body.get_node("CollisionShape2D")
	print("You Died!!!")
	body.modulate = Color.DARK_RED
	Engine.time_scale = 0.5
	body.velocity.y += -69
	player_collision.queue_free()
	timer.start()
	# save high score
	


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
