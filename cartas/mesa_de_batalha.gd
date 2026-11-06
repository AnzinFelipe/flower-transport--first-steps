class_name MesaDeBatalha
extends Node3D

const CENA_CARTA_3D = preload("res://cartas/carta_3d.tscn")

@export var batalha: DadoBatalha
@onready var slots_equipe = %SlotsEquipe
@onready var slots_inimigos = %SlotsInimigos
@export var escala_cartas: float = 1.9


func _ready() -> void:
	if batalha != null:
		if batalha.equipe != null:
			for i in range(batalha.equipe.size()):
				var membro = batalha.equipe[i]
				if i >= slots_equipe.get_child_count():
					push_warning(
						"A equipe tem mais membros do que a quantidade de slots disponíveis"
					)
					break
				var membro3d = CENA_CARTA_3D.instantiate()
				membro3d.scale = Vector3.ONE * escala_cartas
				membro3d.dado = membro
				var slot_atual = slots_equipe.get_child(i)
				slot_atual.add_child(membro3d)
		if batalha.inimigos != null:
			for i in range(batalha.inimigos.size()):
				var inimigo = batalha.inimigos[i]
				if i >= slots_inimigos.get_child_count():
					push_warning("Existem mais inimigos que a quantidade de slots disponíveis")
					break
				var inimigo3d = CENA_CARTA_3D.instantiate()
				inimigo3d.scale = Vector3.ONE * escala_cartas
				inimigo3d.dado = inimigo
				var slot_atual = slots_inimigos.get_child(i)
				slot_atual.add_child(inimigo3d)
