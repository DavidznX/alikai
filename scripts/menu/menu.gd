extends Control

func settings():
	get_tree().change_scene_to_file("res://scenes/menu/settings.tscn")

func changed():
	print("a")
	get_tree().change_scene_to_file("res://scenes/Maps/Prototype_top_view.tscn")

func quit():
	get_tree().quit()
