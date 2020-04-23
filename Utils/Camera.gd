extends Camera

const MOUSE_SENSITIVITY: float = 0.3
const MOVE_SPEED: float = 50.0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_cancel'):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		elif Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * MOUSE_SENSITIVITY
		rotation_degrees.y -= event.relative.x * MOUSE_SENSITIVITY

func _process(delta: float) -> void:
	var move_vector: Vector3 = Vector3.ZERO
	
	if Input.is_action_pressed('move_forward'):
		move_vector.z -= 1
	if Input.is_action_pressed('move_backward'):
		move_vector.z += 1
	if Input.is_action_pressed('move_left'):
		move_vector.x -= 1
	if Input.is_action_pressed('move_right'):
		move_vector.x += 1
	if Input.is_action_pressed('move_down'):
		move_vector.y -= 1
	if Input.is_action_pressed('move_up'):
		move_vector.y += 1
	move_vector = move_vector.normalized() * MOVE_SPEED
	translate(move_vector * delta)
