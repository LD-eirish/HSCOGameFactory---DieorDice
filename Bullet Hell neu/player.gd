extends CharacterBody2D

class_name player
@onready var _animated_sprite = $AnimatedSprite2D
#var myscript = UI.gd.new()

signal shoot
var can_shoot : bool

signal dmg

const max_speed = 400
const accel = 1500
const friction = 600

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
		can_shoot = false
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
		dmg.emit(10)
