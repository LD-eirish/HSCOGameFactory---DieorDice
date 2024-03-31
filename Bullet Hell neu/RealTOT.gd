extends CanvasLayer

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
