extends CharacterBody3D
class_name CharacterPlayer

@export var speed = 5.0



func _physics_process(_delta):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = Vector3(input_dir.x, 0, input_dir.y)
	velocity = direction * speed
	move_and_slide()
