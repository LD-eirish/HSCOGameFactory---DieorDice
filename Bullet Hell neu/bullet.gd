extends Sprite2D

#var bullet_position = get_node("res://player.gd").get_position()
var bullet_position = get_global_position()
var mouse_position = get_global_mouse_position()
var direction = Vector2.ZERO

#func _physics_process(delta):
	
func _process(delta):
	print(bullet_position)
