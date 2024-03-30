extends CharacterBody2D

class_name player
@onready var _animated_sprite = $AnimatedSprite2D

const max_speed = 400
const accel = 1500 #Beschleunigung
const friction = 600 #Reibung
var rotation_speed = 1.5

var direction = Vector2.ZERO
var rotation_direction = 0

func _process(delta):
	_animated_sprite.play("default")

func _physics_process(delta):
	player_movement(delta)


func get_input():
	#direction.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	#direction.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	direction = Input.get_vector("left", "right", "up", "down") #movement
	#rotation_direction = Input.get_axis("left", "right") #rotation movement
	#velocity = transform.x * Input.get_axis("down", "up") * accel
	return direction.normalized(); rotation_direction.normalized()
	
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
		#rotation += rotation_direction * rotation_speed * delta
		
	move_and_slide()
