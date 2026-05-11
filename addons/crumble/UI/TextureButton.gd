@tool
extends TextureButton

var popup

func _ready() -> void:
	popup = Window.new()
	popup.title = "Crumble"
	get_tree().root.add_child(popup)
	pressed.connect(open)

func open() -> void:
	popup.size = Vector2i(600, 500)
	popup.popup_centered()
