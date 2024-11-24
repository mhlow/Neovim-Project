# @tool
class_name NormalModek extends KeyPressSuper 
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
# --- Enums ---
# --- Constants ---
# --- @export Variables ---
# --- Public Variables ---
# --- Private Variables ---
# --- @onready Variables ---

# =============================================================
# Methods
# =============================================================
# --- Initialisations ---
func _ready() -> void:
	pass

func _init() -> void:
	_action_name = "Normal Mode k"
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
func handle_key_press(input_buffer : Array[KeyPressSuper], visual_editor : VisualEditor) -> bool:
	print("Caret Up")
	var new_pos : Vector2i = Vector2i(visual_editor.get_caret_pos().x, visual_editor.get_caret_pos().y - 1)
	var line : String = visual_editor.get_text().split("\n")[new_pos.y]
	
	if visual_editor.last_vertical:
		# go up and down on the column
		new_pos.x = visual_editor.last_vertical_caret_pos.x
		if max(line.length() - 1, 0) >= new_pos.x:
			visual_editor.last_vertical = false
	elif max(line.length() - 1, 0) < new_pos.x:
		visual_editor.last_vertical_caret_pos = Vector2i(visual_editor.get_caret_pos().x, visual_editor.get_caret_pos().y)
		visual_editor.last_vertical = true
		
	visual_editor.set_caret_pos(new_pos)
	return true
# --- Private Methods ---
