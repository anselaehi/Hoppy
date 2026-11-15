extends Node

var score = 0

func _ready() -> void:
	new_game()

func new_game():
	score = 0
	$display.show()
	$StartTimer.start()
	$display.update_score(score)
	$display.show_message("How fast can you get to the end?")
	

func start_game():
	$display.show()
	$ScoreTimer.start()
	await get_tree().create_timer(2.0)
	$StartPlatform.queue_free()

func _process(delta: float) -> void:
	if $Player.position.y > get_viewport().size.y + 50:
		game_over()
	$EndPlatform.player_landed.connect(on_end)
	
func on_end():
	$ScoreTimer.stop()
	$display.show_you_win()
	await get_tree().create_timer(2.0)
	get_tree().change_scene_to_file("res://main_menu.tscn")

func game_over():
	$ScoreTimer.stop()
	$display.show_game_over()
	
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_score_timer_timeout() -> void:
	score += 1
	$display.update_score(score)
	

func _on_start_timer_timeout() -> void:
	start_game()


func _on_multi_timer_timeout() -> void:
	pass # Replace with function body.
