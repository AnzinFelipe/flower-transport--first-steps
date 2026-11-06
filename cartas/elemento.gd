class_name Elemento
extends RefCounted

enum Elementos {
	PADRAO,
	FOGO,
	AGUA,
	GELO,
	ELETRICIDADE,
	VENTO,
	METAL,
	VENENO,
	SOLAR,
	LUNAR,
}

const NOMES = {
	Elementos.PADRAO: "Padrão",
	Elementos.FOGO: "Fogo",
	Elementos.AGUA: "Água",
	Elementos.GELO: "Gelo",
	Elementos.ELETRICIDADE: "Eletricidade",
	Elementos.VENTO: "Vento",
	Elementos.METAL: "Metal",
	Elementos.VENENO: "Veneno",
	Elementos.SOLAR: "Solar",
	Elementos.LUNAR: "Lunar",
}

const IMAGENS_CARTAS = {
	Elementos.PADRAO: "res://assets/icon.svg",
	Elementos.FOGO: "res://assets/icon.svg",
	Elementos.AGUA: "res://assets/icon.svg",
	Elementos.GELO: "res://assets/icon.svg",
	Elementos.ELETRICIDADE: "res://assets/icon.svg",
	Elementos.VENTO: "res://assets/icon.svg",
	Elementos.METAL: "res://assets/icon.svg",
	Elementos.VENENO: "res://assets/icon.svg",
	Elementos.SOLAR: "res://assets/icon.svg",
	Elementos.LUNAR: "res://assets/icon.svg",
}

const ICONES = {
	Elementos.PADRAO: "res://assets/icon.svg",
	Elementos.FOGO: "res://assets/icon.svg",
	Elementos.AGUA: "res://assets/icon.svg",
	Elementos.GELO: "res://assets/icon.svg",
	Elementos.ELETRICIDADE: "res://assets/icon.svg",
	Elementos.VENTO: "res://assets/icon.svg",
	Elementos.METAL: "res://assets/icon.svg",
	Elementos.VENENO: "res://assets/icon.svg",
	Elementos.SOLAR: "res://assets/icon.svg",
	Elementos.LUNAR: "res://assets/icon.svg",
}


static func nome(elemento: Elementos) -> String:
	if NOMES.has(elemento):
		return NOMES[elemento]
	return ""


static func imagem(elemento: Elementos) -> String:
	if IMAGENS_CARTAS.has(elemento):
		return IMAGENS_CARTAS[elemento]
	return "res://assets/icon.svg"


static func icones(elemento: Elementos) -> String:
	if ICONES.has(elemento):
		return ICONES[elemento]
	return "res://assets/icon.svg"
