extends Control

@export var start_btn : Button
@export var exit_btn : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_btn.pressed.connect(_on_start_pressed)


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/the_game.tscn")


func _on_exit_button_pressed() -> void:
	GameManager.exit_game()
