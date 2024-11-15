extends CharacterBody3D

const JUMP_VELOCITY = 4.5


@export var stats : UnitStats
@export var debug_label : Label3D
@export var debug_raycast : RayCast3D
@export var debug_path : Path3D

var touch_velocity : Vector2

func _ready() -> void:
	SignalBus.touch_movement_registered.connect(on_touch_movement_registered)
	
	
func on_touch_movement_registered(_velocity : Vector2) -> void:
	touch_velocity = _velocity
	debug_label.text = "x: %s, y: %s" % [_velocity.x, _velocity.y]


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "up", "down") + touch_velocity
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y))#.normalized()
	if direction:
		velocity.x = direction.x * stats.walk_speed * 4
		velocity.z = direction.z * stats.walk_speed * 4
	else:
		velocity.x = move_toward(velocity.x, 0, stats.walk_speed)
		velocity.z = move_toward(velocity.z, 0, stats.walk_speed)

	debug_raycast.target_position = velocity * 0.4
	debug_path.curve.set_point_position(1, velocity)
	debug_path.curve.set_point_in(1, Vector3.UP * velocity.length_squared() * 0.2)
	move_and_slide()
