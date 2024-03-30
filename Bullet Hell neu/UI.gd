extends CanvasGroup

@onready var txt_bar_die_d_4 = $"TXT BAR DIE d4"
@onready var txt_bar_die_d_6 = $"TXT BAR DIE d6"
@onready var txt_bar_die_d_8 = $"TXT BAR DIE d8"
@onready var txt_bar_die_d_10 = $"TXT BAR DIE d10"
@onready var txt_bar_die_d_12 = $"TXT BAR DIE d12"
@onready var txt_bar_die_d_20 = $"TXT BAR DIE d20"
@onready var bar_die = $"BAR DIE"
@onready var bar_player = $"BAR PLAYER"
@onready var BossPhase = 1

func _1to2():
	txt_bar_die_d_4.visible = false
	txt_bar_die_d_6.visible = true
	$"BAR DIE".max_value = 1
	$"BAR DIE".value_changed = $"BAR DIE".max_value

func _2to3():
	txt_bar_die_d_6.visible = false
	txt_bar_die_d_8.visible = true
	$"BAR DIE".max_value = 1
	$"BAR DIE".value_changed = $"BAR DIE".max_value

func _3to4():
	txt_bar_die_d_8.visible = false
	txt_bar_die_d_10.visible = true
	$"BAR DIE".max_value = 1
	$"BAR DIE".value_changed = $"BAR DIE".max_value

func _4to5():
	txt_bar_die_d_10.visible = false
	txt_bar_die_d_12.visible = true
	$"BAR DIE".max_value = 1
	$"BAR DIE".value_changed = $"BAR DIE".max_value

func _5to6():
	txt_bar_die_d_12.visible = false
	txt_bar_die_d_20.visible = true
	$"BAR DIE".max_value = 1
	$"BAR DIE".value_changed = $"BAR DIE".max_value

func _dieDMG(DEALT_DMG):
	$"BAR DIE".value_changed = $"BAR DIE".value_changed - DEALT_DMG
	if $"BAR DIE".value_changed == $"BAR DIE".min_value:
		BossPhase +1
		if BossPhase == 2:
			_1to2()
		elif BossPhase == 3:
			_2to3()
		elif BossPhase == 4:
			_3to4()
		elif BossPhase == 5:
			_4to5()
		elif BossPhase == 6:
			_5to6()
		elif BossPhase == 7:
			get_tree().change_scene_to_file("res://scenes/GameWon.tscn")
	
func _playerDMG(TAKEN_DMG):
	$"BAR PLAYER".value_changed = $"BAR PLAYER".value_changed - TAKEN_DMG
	if $"BAR PLAYER".value_changed == $"BAR PLAYER".min_value:
		get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

