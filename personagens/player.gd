class_name Player
extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ACELERACAO = 10.0
const RETARDO = 12.0

@onready var pivo: Node3D = %Pivo
@onready var camera: Camera3D = %Camera

var sensibilidade_mouse: float = 0.002


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("pular") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector(
		"andar_esquerda",
		"andar_direita",
		"andar_frente",
		"andar_tras",
	)
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = lerp(velocity.x, direction.x * SPEED, ACELERACAO * delta)
		velocity.z = lerp(velocity.z, direction.z * SPEED, ACELERACAO * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, RETARDO * delta)
		velocity.z = lerp(velocity.z, 0.0, RETARDO * delta)

	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.screen_relative.x * sensibilidade_mouse)
		pivo.rotate_x(-event.screen_relative.y * sensibilidade_mouse)
		pivo.rotation.x = clamp(pivo.rotation.x, deg_to_rad(-35), deg_to_rad(20))


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if Input.is_action_just_pressed("botao_esq_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
