extends Node

var aniCount = 0

func _ready():
	AudioManager.main_bgm_sfx.stream_paused = false

#func playphase():
	#aniCount= aniCount +1
	#if aniCount == 1:
		#$Label1/Ani1.play("Ani1") #KA ob der Tag zu dem Ani Player funktioniert
	#elif aniCount == 2:
		#$Label2/Ani2.play("Ani2")
	#elif aniCount == 3:
		#$Label3/Ani3.play("Ani3")
	#elif aniCount == 4:
		#$Label4/Ani4.play("Ani4")
	#elif aniCount == 5:
		#$Label5/Ani5.play("Ani5")


func _on_ui_custom():
	aniCount= aniCount +1
	if aniCount == 1:
		$Label1/Ani1.play("Ani") #KA ob der Tag zu dem Ani Player funktioniert
		AudioManager.dont_think_you_can_escape_sfx.play()
	elif aniCount == 2:
		$Label2/Ani2.play("Ani2")
		AudioManager.this_isnt_even_my_final_form_sfx.play()
	elif aniCount == 3:
		$Label3/Ani3.play("Ani3")
		AudioManager.supposed_to_care_sfx.play()
	elif aniCount == 4:
		$Label4/Ani4.play("Ani4")
		AudioManager.still_not_final_form_sfx.play()
	elif aniCount == 5:
		$Label5/Ani5.play("Ani5")
		AudioManager.anger_will_downfall_sfx.play()
