class_name ChoiceButton extends Button


var choice_index: int

signal choice_selected(choice_index: int)


func _on_pressed():
	choice_selected.emit(choice_index)
