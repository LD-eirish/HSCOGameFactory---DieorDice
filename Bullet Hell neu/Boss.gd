extends Node



var speed = 25
var motion = Vector2.ZERO

var player = null


func _physics_process(delta):
	motion = Vector2.ZERO
	if player:
		motion = self.position.direction_to(player) * speed


func _on_detection_area_body_entered(body):
	player = body

