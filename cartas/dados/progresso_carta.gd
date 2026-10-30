class_name ProgressoCarta
extends Resource

enum Melhoria {
	ATAQUE,
	VIDA,
	DEFESA,
}

const NIVEL_MAXIMO := 100
const XP_BASE := 20

const REDUCAO_POR_NV := 0.2
const FRACAO_MIN_XP := 0.1

const BONUS_ATAQUE := 2
const BONUS_VIDA := 5
const BONUS_DEFESA := 1

@export var carta: DadosCartaMembro
@export var nivel := 1
@export var xp := 0
@export var melhorias_pendentes := 0

@export_group("Melhorias escolhidas")
@export var vezes_ataque := 0
@export var vezes_vida := 0
@export var vezes_defesa := 0

@export_group("Ataques")
@export var ataques_equipados: Array[DadosAtaque] = []


func vida_maxima() -> int:
	return carta.vida_maxima + vezes_vida * BONUS_VIDA


func ataque() -> int:
	return carta.ataque + vezes_ataque * BONUS_ATAQUE


func defesa() -> int:
	return carta.defesa + vezes_defesa * BONUS_DEFESA


func xp_para_proximo_nivel() -> int:
	return XP_BASE * nivel


func xp_por_derrotar(xp_do_inimigo: int, nivel_do_inimigo: int) -> int:
	var diferenca := nivel - nivel_do_inimigo
	if diferenca <= 0:
		return xp_do_inimigo
	var fator := maxf(FRACAO_MIN_XP, 1.0 - diferenca * REDUCAO_POR_NV)
	return maxi(1, roundi(xp_do_inimigo * fator))


func ganhar_xp(quantidade: int):
	var niveis_ganhos := 0
	xp += quantidade
	while nivel < NIVEL_MAXIMO and xp < xp_para_proximo_nivel():
		xp -= xp_para_proximo_nivel()
		nivel += 1
		melhorias_pendentes += 1
		niveis_ganhos += 1
	return niveis_ganhos


func escolher_melhoria(melhoria: Melhoria) -> bool:
	if melhorias_pendentes <= 0:
		return false
	melhorias_pendentes -= 1
	match melhoria:
		Melhoria.ATAQUE:
			vezes_ataque += 1
		Melhoria.VIDA:
			vezes_vida += 1
		Melhoria.DEFESA:
			vezes_defesa += 1
	return true
