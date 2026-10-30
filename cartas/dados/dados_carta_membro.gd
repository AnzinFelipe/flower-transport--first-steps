class_name DadosCartaMembro
extends DadosCarta

const MAX_ATAQUES_EQUIPADOS := 4

@export_group("Combate")
@export var ataque := 3
@export var ataques_padrao: Array[DadosAtaque] = []
