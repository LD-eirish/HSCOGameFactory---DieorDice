extends Control
@onready var game_over = $"VBoxContainer/Game Over"
@onready var you_won = $"VBoxContainer2/Game Over" as VBoxContainer

func _ready():
	game_over.visible = false
	you_won.visible = false
	
func won_game():
	you_won.visible = true

func lost_game(): 
	game_over.visible = true


