@tool
extends VBoxContainer

func _ready() -> void:
	$OptionButton.add_item("PSX")
	$OptionButton.add_separator("")
	$OptionButton.add_item("Horror")
	$OptionButton.add_separator("")
	$OptionButton.add_item("Sci-Fi")


func _process(delta: float) -> void:
	pass
