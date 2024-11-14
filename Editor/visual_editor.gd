# @tool
class_name VisualEditor extends VBoxContainer 
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
var _caret_pos : Vector2i = Vector2i(0,0)
# --- @onready Variables ---
@onready var _editor_grid : EditorGridContainer = $GridContainer

# =============================================================
# Methods
# =============================================================
# --- Initialisations ---
func _ready() -> void:
	pass

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
func change_caret_pos(new_pos : Vector2i) -> bool:
	if not _valid_pos(new_pos):
		return false
	_editor_grid.select_character_box(_caret_pos, new_pos)
	_caret_pos = new_pos
	return true

func get_caret_pos() -> Vector2i:
	return _caret_pos

# --- Private Methods ---
func _valid_pos(pos : Vector2i) -> bool:
	return _editor_grid.valid_pos(pos)
