extends CharacterBody2D

class_name player
@onready var _animated_sprite = $AnimatedSprite2D
#var myscript = UI.gd.new()

signal shoot
var can_shoot : bool

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
	_animated_sprite.play("default")
	
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
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	
	if direction == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (direction * accel * delta)
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide()


func _on_short_timer_timeout():
	can_shoot = true

func _on_area_2d_area_entered(area):
	if area.is_in_group("boss_bullet"):
		take_dmg.emit(10)
