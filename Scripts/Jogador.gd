extends CharacterBody3D

@onready var cabeca: Node3D = $cabeca
@onready var camera: Camera3D = $cabeca/Camera3D
@onready var ray: RayCast3D = $cabeca/Camera3D/RayCast3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSIBILITY: float = 0.003
const RANGE: float = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = 9.8

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camera.rotate_x(-event.relative.y * MOUSE_SENSIBILITY)
		cabeca.rotate_y(-event.relative.x * MOUSE_SENSIBILITY)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
	
	if Input.is_action_just_pressed("interagir"):
		_interact()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("pular") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var input_dir : Vector2 = Input.get_vector("esquerda", "direita", "frente", "traz")
	var direction := (cabeca.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0
		velocity.z = 0
	
	move_and_slide()
	

func _interact():
	if ray.is_colliding():
		if global_transform.origin.distance_to(ray.get_collision_point()) < RANGE:
			var collider = ray.get_collider()
			if collider.has_method("interaction"):
				print("is_interacting")
				collider.interaction()
