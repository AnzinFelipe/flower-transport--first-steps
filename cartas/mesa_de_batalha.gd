class_name MesaDeBatalha
extends Node3D

const CENA_CARTA_3D = preload("res://cartas/carta_3d.tscn")
const CENA_BARALHO_3D = preload("res://cartas/baralho/baralho_3d.tscn")
const CENA_ELEMENTOS_3D = preload("res://cartas/baralho/carta_elemento_3d.tscn")
const MAX_ACOES: int = 5
const MAX_MAO: int = 6
const MAX_DESCARTE: int = 2

@export var batalha: DadoBatalha
@export var escala_cartas: float = 1.9
@onready var slots_equipe = %SlotsEquipe
@onready var slots_inimigos = %SlotsInimigos
@onready var slot_baralho = %SlotBaralho
@onready var mao = %Mao
@onready var botao_descarte = %BotaoDescarte

var cartas_mao: Array[CartaElemento3D] = []
var cartas_baralho: Array[CartaElemento3D] = []
var cartas_selecionadas: Array[CartaElemento3D] = []
var cartas_descarte: Array[CartaElemento3D] = []
var turno: int = 0


func _ready() -> void:
	if batalha != null:
		if batalha.equipe != null:
			for i in range(batalha.equipe.size()):
				var membro = batalha.equipe[i]
				if i >= slots_equipe.get_child_count():
					push_warning(
						"A equipe tem mais membros do que a quantidade de slots disponíveis"
					)
					break
				var membro3d = CENA_CARTA_3D.instantiate()
				membro3d.scale = Vector3.ONE * escala_cartas
				membro3d.dado = membro
				var slot_atual = slots_equipe.get_child(i)
				slot_atual.add_child(membro3d)
		if batalha.inimigos != null:
			for i in range(batalha.inimigos.size()):
				var inimigo = batalha.inimigos[i]
				if i >= slots_inimigos.get_child_count():
					push_warning("Existem mais inimigos que a quantidade de slots disponíveis")
					break
				var inimigo3d = CENA_CARTA_3D.instantiate()
				inimigo3d.scale = Vector3.ONE * escala_cartas
				inimigo3d.dado = inimigo
				var slot_atual = slots_inimigos.get_child(i)
				slot_atual.add_child(inimigo3d)
		if batalha.baralho != null:
			var baralho = batalha.baralho
			var baralho3d = CENA_BARALHO_3D.instantiate()
			baralho3d.scale = Vector3.ONE * escala_cartas
			slot_baralho.add_child(baralho3d)
			for carta in baralho.lista_cartas:
				var carta_elemento = CENA_ELEMENTOS_3D.instantiate()
				carta_elemento.elemento = carta
				carta_elemento.scale = Vector3.ONE * escala_cartas
				cartas_baralho.append(carta_elemento)
			cartas_baralho.shuffle()
		if botao_descarte != null:
			botao_descarte.pressed.connect(botao_descarte_pressed)
		comprar(MAX_MAO)


func comprar(num: int):
	for i in range(num):
		if cartas_baralho.is_empty() and cartas_descarte.is_empty():
			push_warning("Não há mais cartas disponíveis no baralho e no descarte!")
			break

		if cartas_baralho.is_empty():
			reembaralhar()
		var carta_nova = cartas_baralho.pop_front()
		if carta_nova != null:
			cartas_mao.append(carta_nova)
			mao.add_child(carta_nova)
			carta_nova.global_position = slot_baralho.global_position
			carta_nova.global_rotation = slot_baralho.global_rotation
			if not carta_nova.clicada.is_connected(carta_clicada):
				carta_nova.clicada.connect(carta_clicada)
	organizar_mao()


func descartar(selecionadas: Array[CartaElemento3D]):
	var cont = 0
	for carta in selecionadas:
		cartas_descarte.append(carta)
		cartas_mao.erase(carta)
		mao.remove_child(carta)
		carta.selecionada = false
		cont += 1
	cartas_selecionadas.clear()
	comprar(cont)
	organizar_mao()


func reembaralhar():
	cartas_baralho.append_array(cartas_descarte)
	cartas_descarte.clear()
	cartas_baralho.shuffle()


func organizar_mao():
	var qnt_cartas = cartas_mao.size()
	if qnt_cartas != 0:
		var largura_leque = 5.0
		var altura_arco = 0.5
		var inclinacao_max = 0.3

		for i in range(qnt_cartas):
			var carta = cartas_mao[i]
			var progressao = 0.0
			if qnt_cartas > 1:
				progressao = (float(i) / float(qnt_cartas - 1)) * 2.0 - 1.0

			var pos_x = progressao * (largura_leque / 2.0)
			var pos_y = (1.0 - (progressao ** 2)) * altura_arco
			var pos_z = float(i) * 0.05

			carta.posicao_alvo = Vector3(pos_x, pos_y, pos_z)
			carta.rotacao_alvo = Vector3(0, 0, -progressao * inclinacao_max)

			carta.atualizar_posicao()


func carta_clicada(carta: CartaElemento3D):
	if carta.selecionada:
		cartas_selecionadas.append(carta)
	else:
		cartas_selecionadas.erase(carta)


func botao_descarte_pressed():
	if cartas_selecionadas.size() > 0 and cartas_selecionadas.size() < 3:
		descartar(cartas_selecionadas.duplicate())
