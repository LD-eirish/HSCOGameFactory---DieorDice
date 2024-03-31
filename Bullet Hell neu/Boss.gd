extends CharacterBody2D

var speed = 0.3

signal shoot
var can_shoot : bool
var rng = RandomNumberGenerator.new()
var random_number

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
		random_number = rng.randi_range(1, 100)
		if random_number>=99:
			random_number = rng.randi_range(1, 3)
			if random_number == 1:	
				AudioManager.end_is_nigh_sfx.play()
			elif random_number == 2:
				AudioManager.the_dice_have_fallen_sfx.play()
			elif random_number == 3:
				AudioManager.you_will_never_reach_the_final_form_sfx.play()
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
