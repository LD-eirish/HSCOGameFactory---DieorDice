extends CharacterBody2D

var speed = 0.3

signal shoot
var can_shoot : bool

signal take_dmg

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

func _physics_process(delta):
	var player_pos = get_parent().get_node("player").global_position
	var direction = player_pos - position
	position += speed * direction * delta

func _on_short_timer_timeout():
	can_shoot = true


func _on_area_2d_area_entered(area):
	if area.is_in_group("player_bullet"):
		take_dmg.emit(10)
