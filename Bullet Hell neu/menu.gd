extends Control

@onready var start_button = $VBoxContainer/start_button as Button
@onready var options_button = $VBoxContainer/options_button as Button
@onready var quit_button = $VBoxContainer/quit_button as Button
@onready var v_box_container = $VBoxContainer as VBoxContainer
@onready var options = $Options as OptionsMenu

#@onready var real_tot = $RealTot as CanvasLayer

func _ready():
	#var scrpt = preload("res://UI.gd").new()

	$VBoxContainer/start_button.grab_focus()
	options.exit_options_menu.connect(on_exit_options_menu)
	v_box_container.visible = true
	options.visible = false
	#real_tot.on_transition_finished.connect()
	#scrpt.txt_bar_die_d_4.visible = true
	#scrpt.txt_bar_die_d_6.visible = false
	#scrpt.txt_bar_die_d_8.visible = false
	#scrpt.txt_bar_die_d_10.visible = false
	#scrpt.txt_bar_die_d_12.visible = false
	#scrpt.txt_bar_die_d_20.visible = false
	#$"BAR DIE".max_value = 50
	#$"BAR DIE".value_changed = $"BAR DIE".max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn") 


func _on_options_pressed():
	v_box_container.visible = false
	options.set_process(true)
	options.visible = true
	##get_tree().change_scene_to_file("res://scenes/options.tscn") 
	
func _on_quit_pressed():
	get_tree().quit()
	
func on_exit_options_menu() -> void:
	v_box_container.visible = true
	options.visible = false
	
