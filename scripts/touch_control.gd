class_name TouchControl extends Control

@export_category("node references")
@export var circle : TextureRect
@export var target_circle : TextureRect
@export_category("parameters")
@export_range(30, 250) var max_distance_px : float = 120

var start_drag_position_px : Vector2
var current_touch_position_px : Vector2
var move_vector : Vector2

func _ready() -> void:
	circle.hide()
	set_process(false)


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			start_drag(event.position)
		else:
			stop_drag()
	if event is InputEventScreenDrag:
		current_touch_position_px = event.position


func start_drag(_from : Vector2) -> void:
	circle.position = _from - circle.size/2
	start_drag_position_px = _from
	current_touch_position_px = _from
	set_process(true)
	circle.show()
	
	
func stop_drag() -> void:
	set_process(false)
	circle.hide()
	current_touch_position_px = Vector2.ZERO
	move_vector = Vector2.ZERO
	SignalBus.touch_movement_registered.emit(Vector2.ZERO)
	
	
func _process(delta: float) -> void:
	move_vector = -(start_drag_position_px - current_touch_position_px).clamp(Vector2.ONE * -max_distance_px, Vector2.ONE * max_distance_px)
	target_circle.position = move_vector
	SignalBus.touch_movement_registered.emit(move_vector / max_distance_px)
