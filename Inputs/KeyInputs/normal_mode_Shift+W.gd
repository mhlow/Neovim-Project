# @tool
class_name NormalModeShiftW extends KeyPressSuper 
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
	_action_name = "Normal Mode Shift W"
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
func handle_key_press(input_buffer : Array[KeyPressSuper], visual_editor : VisualEditor) -> bool:
	print("Next word start (W)")
	var text : String = visual_editor.get_text()
	var new_pos : Vector2i = visual_editor.get_caret_pos()
	var line : String = text.split("\n")[new_pos.y]
	while new_pos.x < line.length() - 1: 
		new_pos.x += 1
		# New word detected
		if RG.is_whitespace(line[new_pos.x - 1]) and not RG.is_whitespace(line[new_pos.x]):
			break
	
	visual_editor.set_caret_pos(new_pos)
	return true
# --- Private Methods ---
