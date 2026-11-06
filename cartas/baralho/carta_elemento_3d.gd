class_name CartaElemento3D
extends Node3D

signal clicada(carta: CartaElemento3D)

@export var elemento: Elemento.Elementos
@onready var arte = %Arte

var escala_original: Vector3
var escala_hover: Vector3
var tween_escala: Tween
var tween_posicao: Tween

var selecionada: bool = false
var posicao_alvo: Vector3
var rotacao_alvo: Vector3


func _ready() -> void:
	var imagem = Elemento.imagem(elemento)
	arte.texture = load(imagem)

	escala_original = scale
	escala_hover = escala_original * 1.1


func atualizar_posicao():
	if tween_posicao and tween_posicao.is_valid():
		tween_posicao.kill()

	var pos_final = posicao_alvo
	if selecionada:
		pos_final.y += 0.4
		pos_final.z += 0.2

	tween_posicao = create_tween()
	tween_posicao.set_parallel(true)
	tween_posicao.set_trans(Tween.TRANS_QUAD)
	tween_posicao.set_ease(Tween.EASE_OUT)
	tween_posicao.tween_property(self, "position", pos_final, 0.25)
	tween_posicao.tween_property(self, "rotation", rotacao_alvo, 0.25)


func _on_area_3d_mouse_entered() -> void:
	mouse_hover(escala_hover)
	if not selecionada:
		position.z = posicao_alvo.z + 0.3


func _on_area_3d_mouse_exited() -> void:
	mouse_hover(escala_original)
	if not selecionada:
		atualizar_posicao()


func mouse_hover(escala: Vector3):
	if tween_escala and tween_escala.is_valid():
		tween_escala.kill()
	tween_escala = create_tween()
	tween_escala.set_trans(Tween.TRANS_QUAD)
	tween_escala.set_ease(Tween.EASE_OUT)
	tween_escala.tween_property(self, "scale", escala, 0.1)


func _on_area_3d_input_event(
	_camera: Node,
	event: InputEvent,
	_event_position: Vector3,
	_normal: Vector3,
	_shape_idx: int,
) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			selecionada = !selecionada
			atualizar_posicao()
			clicada.emit(self)
