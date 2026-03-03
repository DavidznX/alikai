extends Node3D
class_name FightNode

@export var friends_alikais:Array[Alikai]
@export var evil_alikais:Array[Alikai]

@export var friends_targets:Array[Node3D]
@export var evil_targets:Array[Node3D]

@onready var texture_rect: TextureRect = $CanvasLayer/C_telinha/TextureRect
@onready var l_name: Label = $CanvasLayer/C_telinha/L_name
@onready var c_telinha: Control = $CanvasLayer/C_telinha


var alikai_node:PackedScene = preload("res://scenes/criatura/Alikai_generic.tscn")

var alikai_selected:AlikaiNode


# Declarar as variáveis da telinha aqui (escopo da classe)
var hidden_y: float
var visible_y: float

func _ready() -> void:
	load_alikais()
	
	# Configurar posições da telinha
	var viewport_height = get_viewport().get_visible_rect().size.y
	var telinha_height = c_telinha.size.y
	
	hidden_y = viewport_height                      # Posição escondida (abaixo da tela)
	visible_y = viewport_height - telinha_height    # Posição visível (na parte inferior)
	
	# Começa escondida
	c_telinha.position.y = hidden_y

func load_alikais():
	var alikais: Array[Alikai] = SaveData.savePlayer.equipped_alikais
	friends_alikais = alikais
	if alikais.size() <=0: return
	var index = 0
	for i in friends_alikais:
		var new_alikai:AlikaiNode = alikai_node.instantiate()
		new_alikai.alikai_resource = friends_alikais[index]
		add_child(new_alikai)
		new_alikai.global_transform = friends_targets[index].global_transform
		index+=1
		new_alikai.clicked.connect(_selected)
		new_alikai.unclicked.connect(_unselected)
			

func _unselected(node:AlikaiNode):
	pass
	#fazer twin de descer a tela
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_QUART)
	tween.tween_property(c_telinha, "position:y", hidden_y, 0.3)

func _selected(node:AlikaiNode):
	# Sobe a telinha
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUART)
	tween.tween_property(c_telinha, "position:y", visible_y, 0.3)
	
	alikai_selected = node
	texture_rect.texture = node.alikai_resource.SpriteIcon
	l_name.text = node.alikai_resource.nome
