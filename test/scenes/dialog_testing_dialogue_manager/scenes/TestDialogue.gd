extends BaseDialogueTestScene

func _ready() -> void:
	var balloon = load("res://test/scenes/dialog_testing_dialogue_manager/speech_baloon/balloon.tscn").instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(resource, title)
