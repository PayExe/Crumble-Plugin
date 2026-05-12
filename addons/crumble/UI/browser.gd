@tool
extends VBoxContainer

var dictionnaire = {
	"PSX": ["Vertex Wobble", "Dithering", "Scanlines", "Affine Warping"],
	"Horror": ["Shader3"],
	"Sci-Fi": ["Shader4"]
}
func _ready() -> void:
	$OptionButton.add_item("PSX")
	$OptionButton.add_item("Horror")
	$OptionButton.add_item("Sci-Fi")
	$OptionButton.item_selected.connect(update_list)
	$ItemList.size_flags_vertical = Control.SIZE_EXPAND_FILL
	update_list(0)

func update_list(index: int) -> void:
	$ItemList.clear()
	var categorie = $OptionButton.get_item_text(index)
	for shader in dictionnaire[categorie] :
		$ItemList.add_item(shader)
		
