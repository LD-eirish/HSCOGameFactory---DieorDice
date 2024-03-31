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
signal custom
signal damageboss
var player_live = 50
signal AnimationBossPhase

func _ready():
	txt_bar_die_d_4.visible = true
	txt_bar_die_d_6.visible = false
	txt_bar_die_d_8.visible = false
	txt_bar_die_d_10.visible = false
	txt_bar_die_d_12.visible = false
	txt_bar_die_d_20.visible = false
	bar_die.max_value = 50
	damageboss.emit(3)
	bar_die.value = bar_die.max_value
	

func _1to2():
	txt_bar_die_d_4.visible = false
	txt_bar_die_d_6.visible = true
	bar_die.max_value = 75
	bar_die.value = bar_die.max_value
	#custom.connect(RealTot.playphase())
	damageboss.emit(5)
	custom.emit()
	AnimationBossPhase.emit()

func _2to3():
	txt_bar_die_d_6.visible = false
	txt_bar_die_d_8.visible = true
	bar_die.max_value = 125
	bar_die.value = bar_die.max_value
	#custom.connect(RealTot.playphase())
	damageboss.emit(7)
	custom.emit()
	AnimationBossPhase.emit()

func _3to4():
	txt_bar_die_d_8.visible = false
	txt_bar_die_d_10.visible = true
	bar_die.max_value = 200
	bar_die.value = bar_die.max_value
	#custom.connect(RealTot.playphase())
	damageboss.emit(8)
	custom.emit()
	AnimationBossPhase.emit()

func _4to5():
	txt_bar_die_d_10.visible = false
	txt_bar_die_d_12.visible = true
	bar_die.max_value = 250
	bar_die.value = bar_die.max_value
	#custom.connect(RealTot.playphase())
	damageboss.emit(10)
	custom.emit()
	AnimationBossPhase.emit()

func _5to6():
	txt_bar_die_d_12.visible = false
	txt_bar_die_d_20.visible = true
	bar_die.max_value = 1000
	bar_die.value = bar_die.max_value
	#custom.connect(RealTot.playphase())
	damageboss.emit(12)
	custom.emit()
	AnimationBossPhase.emit()

func _on_player_take_dmg(TAKEN_DMG):
	player_live = player_live - TAKEN_DMG
	bar_player.value = player_live
	if player_live <= bar_player.min_value:
		get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func _on_boss_take_dmg(DEALT_DMG):
	bar_die.value = bar_die.value - DEALT_DMG
	if bar_die.value == bar_die.min_value:
		BossPhase = BossPhase+1
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



