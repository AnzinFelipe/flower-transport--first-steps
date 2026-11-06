class_name DadoInimigo
extends Resource

@export var nome: String = "Carta"
@export var nivel: int = 1
@export var vida_padrao: int = 1
@export var defesa_padrao: int = 1
@export var nv_vida: int = 1
@export var nv_ataque: int = 1
@export var nv_defesa: int = 1
@export var xp_valor: int = 1
@export var imagem: Texture2D
@export var ataques: Array[Ataque]
@export var fraquezas: Array[Elemento.Elementos]
@export var resistencias: Array[Elemento.Elementos]

var vida_max: int:
	get:
		return vida_padrao + (nv_vida - 1) * 10
var defesa: int:
	get:
		return defesa_padrao + (nv_defesa - 1) * 2
