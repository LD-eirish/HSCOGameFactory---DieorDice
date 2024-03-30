extends CharacterBody2D

#var target = "player"
#const speed = 100


#func _physics_process(delta):
	#if target:
		#var velocity = global_position.direction_to(target.global_position)
		#move_and_collide(velocity * speed * delta)

# Movement speed
#var speed = 100 
#var player_position
#var target_position
# Get a reference to the player. It's likely different in your project
#var player = get_parent().get_node("player")
 #
#func _physics_process(delta):
	#
	# Set player_position to the position of the player node
	#player_position = player.position
	# Calculate the target position
	#target_position = (player_position - position).normalized()
 #
	#move_and_slide(target_position * speed)
	#velocity += (speed * delta)
	#move_and_slide()
	#look_at(player_position)
#class_name Enemy
#var speed: float = 100.0
##@onready var target = $"../PlayerCharacter"
#@onready var target = $"player"
#
##var player = get_parent().get_node("Player")
#func _physics_process(delta):
	##if target == null: get_tree().get_nodes_in_group("player")
	##if target != null:
	#velocity = position.direction_to(target.position) * speed
	#move_and_slide()
	
const speed = 3.0
var player
func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	
func _physics_process(delta):
	$NavigationAgent2D.set_target_position(player.global_transform_origin)
	var velocity = ($NavigationAgent2D.get_next_path_position() - transform.origin).normalized * speed * delta
	move_and_collide(velocity)
