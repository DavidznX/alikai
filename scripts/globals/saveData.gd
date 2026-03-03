extends Node

var equipped_alikais:Array[Alikai]
var savePlayer:SaveInfoPlayer

func _load_from_info(info:SaveInfoPlayer):
	savePlayer = info
	
	print("carregado informações")
