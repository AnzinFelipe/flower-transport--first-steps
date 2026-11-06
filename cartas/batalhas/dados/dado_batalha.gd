class_name DadoBatalha
extends Resource

@export var nome: String = "Batalha"
@export var descricao: String = "Descricao"
@export var nivel_recomendado: int = 1
@export var imagem_fundo: Texture
@export var musica: AudioStream
@export var baralho: DadoBaralho
@export var equipe: Array[DadoEquipe]
@export var inimigos: Array[DadoInimigo]
