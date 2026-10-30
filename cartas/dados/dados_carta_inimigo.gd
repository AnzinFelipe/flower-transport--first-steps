class_name DadosCartaInimigo
extends DadosCarta

const NUM_ATAQUES := 3

@export_group("Combate")
@export var ataque := 3
@export var ataques: Array[DadosAtaque] = []

@export_group("Recompensa")
@export var xp := 10

@export_group("Crescimento_por_nv")
@export var vida_por_nv := 10
@export var ataque_por_nv := 2
@export var defesa_por_nv := 1
@export var xp_por_nv := 5


func vida_no_nv(nivel: int) -> int:
	return vida_max + vida_por_nv * (nivel - 1)


func ataque_no_nv(nivel: int) -> int:
	return ataque + ataque_por_nv * (nivel - 1)


func defesa_no_nv(nivel: int) -> int:
	return defesa + defesa_por_nv * (nivel - 1)


func xp_no_nv(nivel: int) -> int:
	return xp + xp_por_nv * (nivel - 1)
