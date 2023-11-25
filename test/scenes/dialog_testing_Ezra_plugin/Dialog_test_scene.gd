extends Node2D

@export var dialog_json: JSON
@export var state = {
	"show_only_one": false,
	"player_name": "Ezra",
	"transition_one": false,
	"some_variable": 0,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	($EzDialogue as EzDialogue).start_dialogue(dialog_json, state)


func _on_ez_dialogue_dialogue_generated(response: DialogueResponse) -> void:
	$DialogBox.clear_dialog_box()
	
	$DialogBox.add_text(response.text)
	if response.choices.is_empty():
		$DialogBox.add_choice("...")
	else:
		for choice in response.choices:
			$DialogBox.add_choice(choice)


func _on_ez_dialogue_custom_signal_received(value: String) -> void:
	value = value.replace(" ", "")
	var params = value.split(",")
	if params[0] == "set":
		print(value)
		# set variable command
		var variable_name = params[1]
		var variable_value = params[2]
		state[variable_name] = variable_value


func _on_ez_dialogue_end_of_dialogue_reached() -> void:
	$DialogBox.is_dialog_done = true
