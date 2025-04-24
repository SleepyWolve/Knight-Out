extends Node

@export var player_name: String = "player"
@export var timeout: float = 2.0

@onready var label_name: Label = $InputName/Name
@onready var label_rarity: Label = $InputName/Rarity
@onready var input_name: LineEdit = $InputName
@onready var item_list: ItemList = $InputName/ScoreBoard


var timer: float = 0
var timer_active: bool = true
var rarity: String = ""
var rarity_lvls: Dictionary = {
	"Common": Color.WHITE,
	"Rare": Color.GOLDENROD,
	"Epic": Color.REBECCA_PURPLE,
	"Legendary": Color.RED,
}
var scores = {
	"Player1": 12,
	"Player2": 4,
	"Player3": 8,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_name.text = player_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer_active:
		if timer > timeout:
			timer = 0
		else:
			timer += delta
	if Input.is_action_just_pressed("ui_text_submit"):
		player_name = input_name.text
		set_username(player_name)
		
func set_username(input_n: String):
	var roll = randf()
	print(roll)
	if roll <= 0.6: # Common
		rarity = "Common"
	elif roll <= 0.8: # Rare
		rarity = "Rare"
	elif roll <= 0.95: # Epic
		rarity = "Epic"
	else: # Lengendary
		rarity = "Legendary"
	print(rarity)
	label_name.text = input_n
	label_rarity.text = rarity
	label_rarity.modulate = rarity_lvls.get(rarity, Color.WHITE)
	label_name.modulate = rarity_lvls.get(rarity, Color.WHITE)
	


func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
