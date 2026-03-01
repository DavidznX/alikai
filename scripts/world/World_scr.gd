extends Node
class_name WorldTopView

@export var debug_load:bool
@export var info_player:SaveInfoPlayer

func _ready() -> void:
	if not debug_load: return
	if not info_player: return
	
	
	SaveData._load_from_info(info_player)
