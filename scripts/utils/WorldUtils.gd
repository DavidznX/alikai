extends Node
class_name WorldUtils

static func start_combat(current_scene:Node):
	
	current_scene.get_tree().change_scene_to_file("res://scenes/essenciais/Generic_fight.tscn")
	
