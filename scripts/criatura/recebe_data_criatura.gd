extends Node3D

@export var CriaturaData: Criatura
@onready var carregador_modelo3d: Node3D = $mesh

func _ready() -> void:
	if CriaturaData and CriaturaData.patch_modelo3D != "":
		var modelo = load(CriaturaData.patch_modelo3D)
		if modelo:
			var instancia = modelo.instantiate()
			carregador_modelo3d.add_child(instancia)
