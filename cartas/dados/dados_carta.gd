class_name DadosCarta
extends Resource

@export var nome := "Carta"
@export var arte: Texture2D

@export_group("Atributos")
@export var vida_max := 20
@export var defesa := 2
@export var fraquezas: Array[Elemento.Tipo] = []
