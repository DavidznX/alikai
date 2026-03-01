extends Node

var equipped_alikais:Array[Alikai]

func _load_from_info(info:SaveInfoPlayer):
	equipped_alikais = info.equipped_alikais
	
	print("carregado informações")
