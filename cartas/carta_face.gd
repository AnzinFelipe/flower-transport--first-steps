class_name CartaFace
extends PanelContainer

@onready var nome = %Nome
@onready var nivel = %Nivel
@onready var arte = %Arte
@onready var hbox_fraq = %HBoxFraquezas
@onready var hbox_resis = %HBoxResistencias
@onready var barra_vida = %BarraVida
@onready var defesa = %Defesa


func popular_face(dado: Resource) -> void:
	nome.text = dado.nome
	nivel.text = "Nv. " + str(dado.nivel)
	barra_vida.max_value = dado.vida_max
	barra_vida.value = dado.vida_max
	arte.texture = dado.imagem
	defesa.text = "Defesa: " + str(dado.defesa)
	for i in dado.fraquezas:
		var texto_fraq = Elemento.nome(i)
		var fraqueza = Label.new()
		fraqueza.text = texto_fraq
		fraqueza.add_theme_font_size_override("font_size", 20)
		hbox_fraq.add_child(fraqueza)

	for i in dado.resistencias:
		var texto_resis = Elemento.nome(i)
		var resistencia = Label.new()
		resistencia.text = texto_resis
		resistencia.add_theme_font_size_override("font_size", 20)
		hbox_resis.add_child(resistencia)
