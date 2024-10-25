class_name PlayerCamera extends Node3D

@export var target : Node3D

func _physics_process(delta: float) -> void:
	if target:
		position = target.position
