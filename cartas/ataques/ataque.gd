class_name Ataque
extends Resource

@export var nome: String = "Ataque"
@export var elemento: Elemento.Elementos = Elemento.Elementos.PADRAO
@export var dano: int = 1
@export var efeito: EfeitoAtaque.Efeito = EfeitoAtaque.Efeito.QUEIMADURA
