# @tool
class_name NormalModeh extends KeyPressSuper 
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
	_action_name = "Normal Mode h"
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
func handle_key_press(input_buffer : Array[KeyPressSuper], visual_editor : VisualEditor) -> bool:
	print("Caret Left")
	visual_editor.last_vertical = false
	var new_pos : Vector2i = Vector2i(visual_editor.get_caret_pos().x - 1, visual_editor.get_caret_pos().y)
	visual_editor.set_caret_pos(new_pos)
	return true
# --- Private Methods ---
