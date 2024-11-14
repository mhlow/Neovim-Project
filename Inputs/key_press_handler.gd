# @tool
class_name KeyPressHandler extends Control
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
var _key_inputs : Array[KeyPressSuper] = [
	NormalModeDown.new(),
	NormalModeUp.new(),
	NormalModeRight.new(),
	NormalModeLeft.new(),
]
var _last_input : KeyPressSuper
var _input_buffer : Array[KeyPressSuper]
# --- @onready Variables ---
# Could be dangerous idk
@onready var _editor : CodeEdit = self.get_parent()

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

func _input(event: InputEvent) -> void:
	if event.is_pressed():
		for key_input in _key_inputs:
			# Last input and this code just ensures multiple keys dont get registered
			if Input.is_action_just_pressed(key_input.get_action_name()):
				_last_input = key_input
				break
			
			if Input.is_action_pressed(key_input.get_action_name()) and _last_input == key_input:
				key_input.handle_key_press()
		
# --- Public Methods ---
# --- Private Methods ---