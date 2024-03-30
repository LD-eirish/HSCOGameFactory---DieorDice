extends CharacterBody2D

class_name player
@onready var _animated_sprite = $AnimatedSprite2D

const max_speed = 400
const accel = 1500 #Beschleunigung
const friction = 600 #Reibung
#var rotation_speed = 1.5
#var bullet_speed = 1000

var sprite

#var bullet = preload("res://bullet.tscn")
@onready var bullet_sprite2D = load("res://bullet.tscn")

var direction = Vector2.ZERO
var bullet_direction
var rotation_direction = 0

func _process(delta):
	_animated_sprite.play("default")
	#look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("fire"):
		#var bullet_instance = bullet.instance()
		#bullet.position = get_global_position()
		#bullet.apply_impulse(Vector2(), Vector2(bullet_speed), 0)
		#get_tree().get_root().add_child(bullet)
		#var sprite = Sprite2D.new()
		#sprite.texture = load("res://icon.svg")
		#$Node.add_child(sprite)
		#get_node("player").add_child(bullet)
		var bullet_sprite = bullet_sprite2D.instantiate()
		add_child(bullet_sprite)
		#bullet_sprite.position = get_global_mouse_position() - bullet_sprite.global_position
		#bullet_sprite.velocity = bullet_sprite.position * accel * delta
		#print(bullet.global_position)
		#print(get_global_mouse_position())
		
		
		#bullet.set_script("bullet.gd")
		#bullet_direction += 
		
		
		
		#sprite.texture = load("res://icon.svg")

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
