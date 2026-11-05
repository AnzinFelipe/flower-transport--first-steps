class_name EfeitoAtaque
extends RefCounted

enum Efeito {
	QUEIMADURA,
	ENCHARCAMENTO,
	CONGELAMENTO,
	PARALISIA,
	ENVENENAMENTO,
	CONFUSAO,
}

const NOMES = {
	Efeito.QUEIMADURA: "Queimadura",
	Efeito.ENCHARCAMENTO: "Encharcamento",
	Efeito.CONGELAMENTO: "Congelamento",
	Efeito.PARALISIA: "Paralisia",
	Efeito.ENVENENAMENTO: "Envenenamento",
	Efeito.CONFUSAO: "Confusão",
}


static func nome(efeito: Efeito) -> String:
	if NOMES.has(efeito):
		return NOMES[efeito]
	return ""
