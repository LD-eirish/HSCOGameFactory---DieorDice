extends CharacterBody2D

var speed = 0.3
var animeCount = 0
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



func _on_ui_animation_boss_phase():
	animeCount = animeCount +1
	$AnimatedSprite2D.play("Phase1")
	if animeCount == 1:
		$AnimatedSprite2D.play("Phase2")
	elif animeCount == 2:
		$AnimatedSprite2D.play("Phase3")
	elif animeCount == 3:
		$AnimatedSprite2D.play("Phase4")
	elif animeCount == 4:
		$AnimatedSprite2D.play("Phase5")
	elif animeCount == 5:
		$AnimatedSprite2D.play("Phase6")

