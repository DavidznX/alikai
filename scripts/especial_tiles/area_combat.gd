extends Area3D

@export var chances_ent_combat:float = 1

func _ready() -> void:
	body_entered.connect(_on_body_entered) 
	

func _on_body_entered(_body:Node3D):
	#var player:CharacterPlayer
	#if body is CharacterPlayer: player = body
	#else:return
	print("player entrou na area de combate")
	WorldUtils.start_combat(self)
