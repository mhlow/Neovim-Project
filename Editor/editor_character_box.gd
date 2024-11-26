# @tool
class_name CharacterBox extends Label 
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
# --- Enums ---
enum State {
	DEFAULT,
	SELECTED,
}
# --- Constants ---
# --- @export Variables ---
# --- Public Variables ---
# --- Private Variables ---
var _state : State = State.DEFAULT
# --- @onready Variables ---
@onready var _editor_character_box_default : StyleBox = preload("res://Editor/editor_character_box_default.tres")
@onready var _editor_character_box_selected : StyleBox = preload("res://Editor/editor_character_box_selected.tres")
#@onready var _editor_character_box_insert_left : StyleBox = preload("res://Editor/editor_character_box_insert_left.tres")

@onready var _editor_character_label_default : LabelSettings = preload("res://Editor/editor_character_label_default.tres")
@onready var _editor_character_label_selected : LabelSettings = preload("res://Editor/editor_character_label_selected.tres")

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
func get_state() -> State:
	return _state

func set_state(state : State) -> void:
	_state = state
	match _state:
		State.DEFAULT:
			remove_theme_stylebox_override("normal")
			add_theme_stylebox_override("normal", _editor_character_box_default)
			label_settings = _editor_character_label_default
		State.SELECTED:
			remove_theme_stylebox_override("normal")
			add_theme_stylebox_override("normal", _editor_character_box_selected)
			label_settings = _editor_character_label_selected

# --- Private Methods ---
