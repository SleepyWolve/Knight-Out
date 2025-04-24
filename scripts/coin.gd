extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var game_man: Node = %GameMan

func _ready() -> void:
	#animation_player.play("RESET")
	pass

func _on_body_entered(_body: Node2D) -> void:
	animation_player.play("Pickup")
	game_man.add_point(1)
