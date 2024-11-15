@tool
class_name Tools extends Node

@export_tool_button("Add sprite", "Sprite3D") var add_sprite_button = _add_sprite
@export_tool_button("Add player") var add_player_button = _add_player
@export var test_owner : Node3D
@export var player_scene : PackedScene

@export var run_function : bool

func _add_sprite() -> void:
	var new_sprite : Sprite3D = Sprite3D.new()
	new_sprite.texture = load("res://icon.svg")
	test_owner.add_child(new_sprite)
	new_sprite.owner = get_parent()
	new_sprite.position = Vector3.LEFT * randf() * 5


func _add_player() -> void:
	var new_player : CharacterBody3D = player_scene.instantiate()
	test_owner.add_child(new_player)
	new_player.owner = get_parent()
	
	
