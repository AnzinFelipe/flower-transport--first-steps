class_name DadosAtaque
extends Resource

enum Alvo {
	UM_INIMIGO,
	TODOS_INIMIGOS,
}

@export var nome := "Ataque"
@export_multiline var descricao := ""

@export_group("Custo e efeito")
@export var custo: Array[Elemento.Tipo] = []
@export var elemento: Elemento.Tipo = Elemento.Tipo
@export var dano := 5
@export var alvo: Alvo = Alvo.UM_INIMIGO
