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
var tween_escala: Tween


func _ready() -> void:
	if dado and carta:
		carta.popular_face(dado)

	escala_original = scale
	escala_hover = escala_original * 1.1


func _on_area_3d_mouse_entered() -> void:
	mouse_hover(escala_hover)


func _on_area_3d_mouse_exited() -> void:
	mouse_hover(escala_original)


func mouse_hover(escala: Vector3) -> void:
	if tween_escala and tween_escala.is_valid():
		tween_escala.kill()
	tween_escala = create_tween()
	tween_escala.set_trans(Tween.TRANS_QUAD)
	tween_escala.set_ease(Tween.EASE_OUT)
	tween_escala.tween_property(self, "scale", escala, 0.1)
