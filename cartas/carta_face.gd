class_name CartaFace
extends PanelContainer

@onready var nome = %Nome
@onready var nivel = %Nivel
@export var dado: DadoCarta


func _ready() -> void:
	nome.text = dado.nome
	nivel.text = str(dado.nivel)
