extends CharacterBody2D



var speed = 25
var motion = Vector2.ZERO
var player_position = Vector2.ZERO

#var player = null

signal shoot
var can_shoot : bool
#@onready player_position = $"../player".global_position

func _ready():
	can_shoot = true

func _process(delta):
	if can_shoot:
		var player_pos = get_parent().get_node("player").global_position
		var dir = player_pos - position
		shoot.emit(position, dir)
		#print(player_pos)
		can_shoot = false
		$ShortTimer.start()



#func _physics_process(delta):
#	motion = Vector2.ZERO
#	if player:
#		motion = position.direction_to(player) * speed


#func _on_detection_area_body_entered(body):
	#player = body



func _on_short_timer_timeout():
	can_shoot = true
