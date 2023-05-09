extends Node2D


@onready var startButton = %StartButton
@onready var continueButton = %ContinueButton
@onready var optionsButton = %OptionsButton
@onready var exitButton = %ExitButton


func _ready():
	startButton.grab_focus()


func _on_start_button_pressed():
	startButton.playClickMe()
	await startButton.me_play_finished
	get_tree().change_scene_to_file("res://Scene/World/Main.tscn")

func _on_continue_button_pressed():
	continueButton.playClickMe()
	await continueButton.me_play_finished
	pass


func _on_options_button_pressed():
	optionsButton.playClickMe()
	await optionsButton.me_play_finished
	pass

func _on_exit_button_pressed():
	exitButton.playClickMe()
	await exitButton.me_play_finished
	get_tree().quit()
