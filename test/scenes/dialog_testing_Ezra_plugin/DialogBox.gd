extends Node2D

@onready var choice_button_scn = preload("res://test/scenes/ChoiceButton.tscn")
var choice_buttons: Array[Button] = []

var is_dialog_done = false

func clear_dialog_box():
	$VBoxContainer/Label.text = ""
	for choice in choice_buttons:
		$VBoxContainer.remove_child(choice)
	choice_buttons = []

func add_text(text: String):
	$VBoxContainer/Label.text = text
	pass
	
func add_choice(choice_text: String):
	var btn_obj : ChoiceButton = choice_button_scn.instantiate()
	btn_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(btn_obj)
	btn_obj.text = choice_text
	btn_obj.choice_selected.connect(_on_choice_selected)
	$VBoxContainer.add_child(btn_obj)
	
func _on_choice_selected(choice_index: int):
	if !is_dialog_done:
		($"../EzDialogue" as EzDialogue).next(choice_index)
	else:
		clear_dialog_box()
	pass


