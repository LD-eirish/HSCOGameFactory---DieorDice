extends CanvasLayer

#signal on_transition_finished

#@onready var label = $"."
#@onready var animationplayer = $AnimationPlayer

#func _ready():
#	label.visible = false
#	animationplayer.animation_finished.connect(_on_animation_finished)

var aniCount = 0

func playphase():
	aniCount= aniCount +1
	if aniCount == 1:
		$Label/AnimationPlayer.play("Ani") #KA ob der Tag zu dem Ani Player funktioniert
	elif aniCount == 2:
		$Label/AnimationPlayer.play("Ani2")
	elif aniCount == 3:
		$Label/AnimationPlayer.play("Ani3")
	elif aniCount == 4:
		$Label/AnimationPlayer.play("Ani4")
	elif aniCount == 5:
		$Label/AnimationPlayer.play("Ani5")


#func _on_animation_finished(anim_name):
#	if anim_name == "FADE IN":
#		on_transition_finished.emit()
#		animationplayer.play("FADE IN_2 (OUT)")
#	elif anim_name == "FADE IN_2 (OUT)":
#		label.visible = false


#func phase1to2():
#	label.visible = true
#	animationplayer.play("FADE IN")
