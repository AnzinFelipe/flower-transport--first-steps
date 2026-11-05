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


static func nome(elemento: Elementos) -> String:
	if NOMES.has(elemento):
		return NOMES[elemento]
	return ""
