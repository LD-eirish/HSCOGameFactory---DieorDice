extends CanvasLayer

signal on_transition_finished

@onready var label = $phase1to2
@onready var animationplayer = $AnimationPlayer

func _ready():
	label.visible = false
	animationplayer.animation_finished.connect(_on_animation_finished)
	

func _on_animation_finished(anim_name):
	if anim_name == "FADE IN":
		on_transition_finished.emit()
		animationplayer.play("FADE IN_2 (OUT)")
	elif anim_name == "FADE IN_2 (OUT)":
			label.visible = false



func phase1to2():
	label.visible = true
	animationplayer.play("FADE IN")
