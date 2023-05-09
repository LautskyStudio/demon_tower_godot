extends Button

signal me_play_finished


@onready var tween = get_tree().create_tween().set_loops()
@onready var focusMe = $FocusMe
@onready var focusMeFile = preload("res://Audio/SE/[System]Enter03_default.ogg")
@onready var clickMeFile = preload("res://Audio/SE/[System]Enter04_panop.ogg")


func playClickMe():
	focusMe.stream = clickMeFile
	focusMe.play()


func playFocusMe():
	focusMe.stream = focusMeFile
	focusMe.play()


func _ready():
	tween.tween_property(self, "theme_override_styles/focus:bg_color", Color(0.4, 0.4, 0.4), 0.7)
	tween.tween_property(self, "theme_override_styles/focus:bg_color", Color(0.3, 0.3, 0.3), 0.7)
	tween.stop()


func _on_window_item_mouse_entered():
	self.grab_focus()


func _on_focus_entered():
	playFocusMe()
	tween.play()


func _on_focus_exited():
	tween.stop()


func _on_item_focus_me_finished():
	me_play_finished.emit()
