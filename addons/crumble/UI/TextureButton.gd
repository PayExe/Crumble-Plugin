@tool
extends TextureButton

var popup

func _ready() -> void:
	popup = Window.new()
	popup.title = "Crumble - Shader Library"
	get_tree().root.add_child(popup)

	var content = preload("res://addons/crumble/UI/browser.tscn").instantiate()
	popup.add_child(content)

	pressed.connect(open)
	popup.close_requested.connect(close)

func open() -> void:
	popup.size = Vector2i(600, 500)
	popup.popup_centered()

func close() -> void:
	popup.hide()
