extends Control

var languageCodes = ["en","ru","Arm"]

@onready var button: Button = $CanvasLayer/Languages/Button
@onready var button_2: Button = $CanvasLayer/Languages/Button2
@onready var button_3: Button = $CanvasLayer/Languages/Button3



func _ready() -> void:
	$CanvasLayer/Title/AnimationPlayer.play("Title")
	button.pressed.connect(func change_arm():
		TranslationServer.set_locale("arm")
		UpdateUI()
		)

	button_2.pressed.connect(func change_ru():
		TranslationServer.set_locale("ru")
		UpdateUI()
	)

	button_3.pressed.connect(func change_en():
		TranslationServer.set_locale("en")
		UpdateUI()
	)
func _on_new_game_pressed() -> void:
	await $CanvasLayer/Fade.FadeOFF()
	$Timer.start()
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file('res://Scenes/start_title.tscn')
	pass # Replace with function body.


func UpdateUI():
	$CanvasLayer/Buttons/NewGame.text = tr("START")
	$CanvasLayer/Buttons/Continiue.text = tr("CONTIINUE")
	$CanvasLayer/Buttons/EXIT.text = tr("EXIT")
