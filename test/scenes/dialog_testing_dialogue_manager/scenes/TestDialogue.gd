extends Node2D

var dialogue: DialogueResource = load("res://test/scenes/dialog_testing_dialogue_manager/dialogues/main.dialogue")

func _ready() -> void:
	var balloon = load("res://test/scenes/dialog_testing_dialogue_manager/speech_baloon/balloon.tscn").instantiate()
	get_tree().current_scene.add_child(balloon)
	var childBalloon := get_tree().current_scene.get_node("ExampleBalloon/Balloon")
	var balloonPos : Vector2 = childBalloon.position
	childBalloon.position = Vector2(0,0)
	print(balloonPos)
	balloon.start(dialogue, "start")
