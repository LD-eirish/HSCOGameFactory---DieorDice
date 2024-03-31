extends CharacterBody2D

class_name player
@onready var _animated_sprite = $AnimatedSprite2D
#var myscript = UI.gd.new()

signal shoot

var can_shoot : bool
var out_damage

signal take_dmg

const max_speed = 400
const accel = 1500
const friction = 600

var rng = RandomNumberGenerator.new()
var random_number
var direction = Vector2.ZERO

func _ready():
	can_shoot = true

func _process(delta):
	#plays the animated sprites
	print(velocity)
	
	#shooting
	if Input.is_action_pressed("fire") and can_shoot:
		var dir = get_global_mouse_position() - position
		shoot.emit(position, dir)
		random_number = rng.randi_range(1, 100)
		AudioManager.fireball_sound_sfx.play()
		can_shoot = false
		if random_number>=99:
			random_number = rng.randi_range(1, 3)
			if random_number == 1:	
				AudioManager.bow_to_your_creator_sfx.play()
			elif random_number == 2:
				AudioManager.how_do_i_deserve_this_sfx.play()
			elif random_number == 3:
				AudioManager.this_is_not_happening_sfx.play()
			
		$ShortTimer.start()

func _physics_process(delta):
	player_movement(delta)


func get_input():
	#movement
	direction = Input.get_vector("left", "right", "up", "down")
	return direction.normalized()
	
func player_movement(delta):
	get_input()
	
	if velocity.x == 0 && velocity.y == 0:
		$AnimatedSprite2D.play("Stehen")
	if velocity.x > 1:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	else :
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
	if velocity.y > 1:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("hoch")
	print(velocity)
		
	
	if direction == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (direction * accel * delta)
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_short_timer_timeout():
	can_shoot = true

func _on_area_2d_area_entered(area):
	if area.is_in_group("boss_bullet"):
		take_dmg.emit(out_damage)

#deal_damage.emit(10)

func _on_ui_damageboss(boss_damage):
	out_damage = boss_damage
