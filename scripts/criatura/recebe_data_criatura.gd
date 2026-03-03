extends Node3D
class_name AlikaiNode

@onready var carregador_modelo3d: Node3D = $mesh
var alikai_resource:Alikai

signal clicked(node:AlikaiNode)
signal unclicked(node:AlikaiNode)

func _ready():
	set_process_input(false)
	if alikai_resource and alikai_resource.modelo3D:
		var instancia = alikai_resource.modelo3D.instantiate()
		carregador_modelo3d.add_child(instancia)


func _on_area_3d_mouse_entered() -> void:
	set_process_input(true)

func _on_area_3d_mouse_exited() -> void:
	set_process_input(false)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("alikai selecionado: ", alikai_resource.nome)
			clicked.emit(self)
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			print("Botão direito pressionado")
			unclicked.emit(self)
