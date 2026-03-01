extends Node3D
class_name FightNode

@export var friends_alikais:Array[Alikai]
@export var evil_alikais:Array[Alikai]

@export var friends_targets:Array[Node3D]
@export var evil_targets:Array[Node3D]

var alikai_node:PackedScene = preload("res://scenes/criatura/Alikai_generic.tscn")

func _ready() -> void:
	load_alikais()

func load_alikais():
	var alikais: Array[Alikai] = SaveData.equipped_alikais
	friends_alikais = alikais
	if alikais.size() <=0: return
	var index = 0
	for i in friends_alikais:
		var new_alikai:AlikaiNode = alikai_node.instantiate()
		new_alikai.alikai_resource = friends_alikais[index]
		add_child(new_alikai)
		new_alikai.global_transform = friends_targets[index].global_transform
		index+=1
		
		
	
