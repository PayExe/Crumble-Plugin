@tool
extends EditorPlugin

var tool

func _enter_tree() -> void:
	tool = preload("res://addons/crumble/ui/dock.tscn").instantiate()
	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, tool)

func _exit_tree() -> void:
	remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, tool)
	tool.queue_free()
