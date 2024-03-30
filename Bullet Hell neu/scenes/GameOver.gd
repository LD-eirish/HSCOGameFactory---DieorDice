extends Control

func _ready():
	$"VBoxContainer/Game Over".visible = false
	$VBoxContainer2/youwon.visible = false
	
func won_game():
	$VBoxContainer2/youwon.visible = true

func lost_game(): 
	$"VBoxContainer/Game Over".visible = true


