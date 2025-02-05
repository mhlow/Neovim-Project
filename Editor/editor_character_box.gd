# @tool
class_name CharacterBox extends Label 
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
signal game_over
# --- Enums ---
enum State {
	DEFAULT,
	SELECTED,
	CHARGINGATTACK,
	ATTACK,
}
# --- Constants ---
# --- @export Variables ---
# --- Public Variables ---
# --- Private Variables ---
var _state : State = State.DEFAULT
# --- @onready Variables ---
@onready var chargingTimer = $"Charging Timer"
@onready var attackTimer = $"Attack Timer"

@onready var _editor_character_box_default : StyleBox = preload("res://Editor/editor_character_box_default.tres")
@onready var _editor_character_box_selected : StyleBox = preload("res://Editor/editor_character_box_selected.tres")
@onready var _editor_character_box_charging_attack : StyleBox = preload("res://Editor/editor_character_box_charging_attack.tres")
@onready var _editor_character_box_attack : StyleBox = preload("res://Editor/editor_character_box_attack.tres")
#@onready var _editor_character_box_insert_left : StyleBox = preload("res://Editor/editor_character_box_insert_left.tres")

@onready var _editor_character_label_default : LabelSettings = preload("res://Editor/editor_character_label_default.tres")
@onready var _editor_character_label_selected : LabelSettings = preload("res://Editor/editor_character_label_selected.tres")

# =============================================================
# Methods
# =============================================================
# --- Initialisations ---
func _ready() -> void:
	chargingTimer.one_shot = true
	attackTimer.one_shot = true
	set_state(_state)

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
	if (_state == State.ATTACK and state == State.SELECTED or state == State.ATTACK and _state == State.SELECTED):
		emit_signal("game_over")
	_state = state
	
	match state:
		State.DEFAULT:
			remove_theme_stylebox_override("normal")
			add_theme_stylebox_override("normal", _editor_character_box_default)
			label_settings = _editor_character_label_default
		State.SELECTED:
			remove_theme_stylebox_override("normal")
			add_theme_stylebox_override("normal", _editor_character_box_selected)
			label_settings = _editor_character_label_selected
		State.CHARGINGATTACK:
			chargingTimer.start()
			remove_theme_stylebox_override("normal")
			add_theme_stylebox_override("normal", _editor_character_box_charging_attack)
			#print("set to charging attack")
		State.ATTACK:
			attackTimer.start()
			remove_theme_stylebox_override("normal")
			add_theme_stylebox_override("normal", _editor_character_box_attack)
			#print("set to attack")

# --- Private Methods ---



func _on_charging_timer_timeout() -> void:
	set_state(State.ATTACK)


func _on_attack_timer_timeout() -> void:
	set_state(State.DEFAULT)
