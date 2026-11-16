extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score(score):
	$ScoreLabel.text = str(score)

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")
	

func show_you_win():
	show_message("You win!")
	$Message.show()

func _on_message_timer_timeout() -> void:
	$Message.hide()
