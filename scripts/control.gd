extends Control

@onready var quit_button = $QuitButton

var prompt: String = "U Sure?"

func _ready():
	quit_button.pressed.connect(_on_quit_button_pressed)

func _on_quit_button_pressed():
	if quit_button.text == prompt:
		_on_quit_confirmed()
	quit_button.text = prompt

func _on_quit_confirmed():
	get_tree().quit()
