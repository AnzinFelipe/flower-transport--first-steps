class_name Carta3D
extends Node3D

@onready var carta: CartaFace = %CartaFace
@export var dado: Resource:
	set(novo_dado):
		dado = novo_dado
		if is_node_ready() and carta:
			carta.popular_face(dado)

var escala_original: Vector3
var escala_hover: Vector3
var escala_ampliar: Vector3
var ampliado: bool = false
var tween_escala: Tween
var tween_posicao: Tween
var posicao_original: Vector3
var distancia_da_cera: float = 8.4
static var carta_aberta_atual: Carta3D = null


func _ready() -> void:
	if dado and carta:
		carta.popular_face(dado)

	escala_original = scale
	escala_hover = escala_original * 1.1
	escala_ampliar = escala_original * 2.2
	posicao_original = global_position


func _on_area_3d_mouse_entered() -> void:
	if not ampliado:
		mouse_hover(escala_hover)


func _on_area_3d_mouse_exited() -> void:
	if not ampliado:
		mouse_hover(escala_original)


func mouse_hover(escala: Vector3) -> void:
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
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if ampliado:
				ampliar(escala_original)
				posicionar(posicao_original)
				ampliado = false
				carta_aberta_atual = null
			else:
				if carta_aberta_atual == null:
					var posicao_centro = calcular_posicao_centro_tela()
					ampliar(escala_ampliar)
					posicionar(posicao_centro)
					ampliado = true
					carta_aberta_atual = self


func ampliar(escala: Vector3):
	if tween_escala and tween_escala.is_valid():
		tween_escala.kill()
	tween_escala = create_tween()
	tween_escala.set_trans(Tween.TRANS_QUAD)
	tween_escala.set_ease(Tween.EASE_OUT)
	tween_escala.tween_property(self, "scale", escala, 0.1)


func posicionar(posicao: Vector3):
	if tween_posicao and tween_posicao.is_valid():
		tween_posicao.kill()
	tween_posicao = create_tween()
	tween_posicao.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween_posicao.tween_property(self, "global_position", posicao, 0.25)


func calcular_posicao_centro_tela() -> Vector3:
	var camera = get_viewport().get_camera_3d()
	if camera:
		var direcao_camera = -camera.global_transform.basis.z.normalized()
		return camera.global_position + (direcao_camera * distancia_da_cera)
	return posicao_original
