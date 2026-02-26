extends Node3D

@export var CriaturaData: Criatura
@onready var carregador_modelo3d: Node3D = $mesh

func _ready():
	if CriaturaData and CriaturaData.modelo3D:
		var instancia = CriaturaData.modelo3D.instantiate()
		carregador_modelo3d.add_child(instancia)
