class_name DadosLuta
extends Resource

const MAX_INIMIGOS := 5

@export var nome := "Nova luta"
@export_multiline var descricao := ""

@export_group("Inimigos")
@export var inimigos: Array[EntradaInimigo] = []


func entradas_validas() -> Array[EntradaInimigo]:
	var lista: Array[EntradaInimigo] = []
	for entrada in inimigos:
		if entrada != null and entrada.carta != null:
			lista.append(entrada)
	return lista


func id() -> String:
	return resource_path


func avisos() -> Array[String]:
	var lista: Array[String] = []
	if entradas_validas().is_empty():
		lista.append("Luta sem inimigos.")
	if inimigos.size() > MAX_INIMIGOS:
		lista.append("Mais de %d slots: o que passar disso não cabe na mesa." % MAX_INIMIGOS)
	for entrada in entradas_validas():
		if entrada.carta.ataques.size() != DadosCartaInimigo.NUM_ATAQUES:
			lista.append(
				"%s deveria ter %d ataques." % [entrada.carta.nome, DadosCartaInimigo.NUM_ATAQUES],
			)
	return lista
