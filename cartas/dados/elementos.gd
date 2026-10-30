class_name Elemento
extends RefCounted

enum Tipo {
	FOGO,
	AGUA,
	GELO,
	ELETRICIDADE,
	VENENO,
	METAL,
	VENTO,
	SOLAR,
	LUNAR,
}

const NOMES := {
	Tipo.FOGO: "Fogo",
	Tipo.AGUA: "Água",
	Tipo.GELO: "Gelo",
	Tipo.ELETRICIDADE: "Eletricidade",
	Tipo.VENENO: "Veneno",
	Tipo.METAL: "Metal",
	Tipo.VENTO: "Vento",
	Tipo.SOLAR: "Solar",
	Tipo.LUNAR: "Lunar",
}

const CORES := {
	Tipo.FOGO: Color(0.725, 0.0, 0.0, 1.0),
	Tipo.AGUA: Color(0.147, 0.345, 0.771, 1.0),
	Tipo.GELO: Color(0.375, 0.708, 0.873, 1.0),
	Tipo.ELETRICIDADE: Color(0.97, 0.803, 0.0, 1.0),
	Tipo.VENENO: Color(0.12, 0.447, 0.409, 1.0),
	Tipo.METAL: Color(0.371, 0.381, 0.408, 1.0),
	Tipo.VENTO: Color(0.64, 0.697, 0.78, 1.0),
	Tipo.SOLAR: Color(0.949, 0.463, 0.0, 1.0),
	Tipo.LUNAR: Color(0.282, 0.025, 0.37, 1.0),
}


static func nome(tipo: Tipo) -> String:
	return NOMES.get(tipo, "?")


static func cor(tipo: Tipo) -> Color:
	return CORES.get(tipo, Color.WHITE)


static func elementos_baralho() -> Array[Tipo]:
	var lista: Array[Tipo] = []
	for tipo in Tipo.values():
		lista.append(tipo)
	return lista
