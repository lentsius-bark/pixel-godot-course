class_name Door extends Node3D

@export var area : Area3D
@export var anim_player : AnimationPlayer
@export var door_node : AnimatableBody3D

var door_tween : Tween

func _ready() -> void:
	area.body_entered.connect(on_body_entered)
	area.body_exited.connect(on_body_exited)
	
func on_body_entered(_body : Node3D) -> void:
	if door_tween:
		door_tween.kill()
	door_tween = get_tree().create_tween().set_loops()
	door_tween = create_tween().set_parallel().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	door_tween.tween_property(door_node, "position", Vector3.UP * -1.5, 1.0)
	#door_tween.tween_property(door_node, "position", Vector3.ZERO, 1.0).set_delay(2.0)
	#door_tween.tween_property(door_node, "rotation:y", PI * 2, 1.0).as_relative()
	
	
	
	
func on_body_exited(_body : Node3D) -> void:
	return
	if door_tween:
		door_tween.kill()
	door_tween = get_tree().create_tween().set_loops()
	door_tween = create_tween().set_parallel().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	door_tween.tween_property(door_node, "position", Vector3.ZERO, 1.0)
