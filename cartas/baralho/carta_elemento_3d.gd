class_name CartaElemento3D
extends Node3D

@export var elemento: Elemento.Elementos
@onready var arte = %Arte


func _ready() -> void:
	var imagem = Elemento.imagem(elemento)
	arte.texture = load(imagem)
