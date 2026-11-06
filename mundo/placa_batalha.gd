class_name PlacaBatalha
extends Node3D

@export var batalha: DadoBatalha

@onready var painel: MeshInstance3D = %Painel
@onready var area_detecao: Area3D = $Area3D

var player_na_area: Node3D = null
var cena_batalha: PackedScene = preload("res://cartas/mesa_de_batalha.tscn")


func _ready() -> void:
	painel.hide()


func _process(_delta: float) -> void:
	if player_na_area:
		var posicao_alvo = player_na_area.global_position

		posicao_alvo.y = painel.global_position.y

		painel.look_at(posicao_alvo, Vector3.UP)

		if Input.is_action_just_pressed("interagir"):
			entrar_batalha()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_na_area = body
		painel.show()


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body == player_na_area:
		player_na_area = null
		painel.hide()


func entrar_batalha():
	if batalha:
		Gerenciador.batalha_atual = self.batalha
		get_tree().change_scene_to_packed(cena_batalha)
