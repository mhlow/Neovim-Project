# @tool
class_name NormalModeShiftL extends KeyPressSuper 
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
	_action_name = "Normal Mode Shift L"
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
func handle_key_press(input_buffer : Array[KeyPressSuper], visual_editor : VisualEditor) -> bool:
	print("Low Position")
	var new_pos : Vector2i = Vector2i(visual_editor.get_caret_pos().x, visual_editor.get_grid_container().get_grid_dims().y - 1)
	visual_editor.set_caret_pos(new_pos)
	return true
	
# --- Private Methods ---
