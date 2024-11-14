# @tool
class_name EditorController extends Control
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
# --- Enums ---
enum mode {
	NORMAL,
	INSERT,
	VISUAL,
	COMMAND_LINE,
	REPLACE,
	BINARY,
	ORG
}
# --- Constants ---
# --- @export Variables ---
# --- Public Variables ---
# --- Private Variables ---
# --- @onready Variables ---
@onready var _editor : CodeEdit = $Editor

# =============================================================
# Methods
# =============================================================
# --- Initialisations ---
func _ready() -> void:
	_editor.connect("caret_changed", print_caret_pos)

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass



# --- Public Methods ---
func print_caret_pos() -> void:
	print("Caret pos: (" + str(_editor.get_caret_line()) + "," + str(_editor.get_caret_column()) + ")")


# --- Private Methods ---
