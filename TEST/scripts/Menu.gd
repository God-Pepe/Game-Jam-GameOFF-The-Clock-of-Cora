extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene("res://scene/level.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
