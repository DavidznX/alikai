extends Node3D
class_name AlikaiNode

@onready var carregador_modelo3d: Node3D = $mesh
var alikai_resource:Alikai

func _ready():
	if alikai_resource and alikai_resource.modelo3D:
		var instancia = alikai_resource.modelo3D.instantiate()
		carregador_modelo3d.add_child(instancia)


func _on_area_3d_mouse_entered() -> void:
	print('mouse dentro')


func _on_area_3d_mouse_exited() -> void:
	print('mouse fora')
