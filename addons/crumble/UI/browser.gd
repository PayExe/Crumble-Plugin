@tool
extends VBoxContainer

var selected_node = null

var dictionnaire = {
	"PSX": ["Vertex Wobble", "Dithering", "Scanlines", "Affine Warping"],
	"Horror": ["Shader3"],
	"Sci-Fi": ["Shader4"]
}

var shader_path = {
	"Dithering" : "res://addons/crumble/shaders/PSX/dithering.gdshader",
	"Scanlines" : "res://addons/crumble/shaders/PSX/scanlines.gdshader",
	"CRT warp" : "res://addons/crumble/shaders/PSX/crt_warp.gdshader",
	"Chromatic aberration" : "res://addons/crumble/shaders/PSX/chromatic_aberration.gdshader",
	"VHS noise" : "res://addons/crumble/shaders/PSX/vhs_noise.gdshader",
	"Flicker" : "res://addons/crumble/shaders/PSX/flicker.gdshader",
	"Vignette" : "res://addons/crumble/shaders/PSX/vignette.gdshader",
}

var editor_settings = EditorInterface.get_editor_settings()

func _ready() -> void:
	$OptionButton.add_item("PSX")
	$OptionButton.add_item("Horror")
	$OptionButton.add_item("Sci-Fi")
	$OptionButton.item_selected.connect(update_list)
	$Button.pressed.connect(apply_button)
	EditorInterface.get_selection().selection_changed.connect(update_selected_node)
	$ItemList.size_flags_vertical = Control.SIZE_EXPAND_FILL
	update_list(0)

func update_list(index: int) -> void:
	$ItemList.clear()
	var categorie = $OptionButton.get_item_text(index)
	for shader in dictionnaire[categorie] :
		$ItemList.add_item(shader)

func apply_button() -> void:
	var shaderone = $ItemList.get_selected_items()
	var index = shaderone [0]
	var name = $ItemList.get_item_text(index)
	var path = shader_path[name]
	var loading = load(path)
	var get_node = EditorInterface.get_selection().get_selected_nodes()
	var mat = ShaderMaterial.new()
	mat.shader = loading
	get_node[0].material = mat
	if selected_node:
		selected_node.material = mat

func update_selected_node() -> void:
	var nodes = EditorInterface.get_selection().get_selected_nodes()
	if nodes.size() > 0:
		selected_node = nodes[0]
