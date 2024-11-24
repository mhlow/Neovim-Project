# @tool
class_name RG extends RefCounted 
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
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
# Checks if the whole string is composed of alphanumeric values
static func is_alphanumeric(str : String) -> bool:
	var regex : RegEx = RegEx.new()
	regex.compile("^[a-zA-Z0-9]*$")
	var result = regex.search(str)
	if result:
		return result.get_string(0) == str
	return false

static func is_whitespace(str : String) -> bool:
	var regex : RegEx = RegEx.new()
	regex.compile("^\\s*$")
	var result = regex.search(str)
	if result:
		return result.get_string(0) == str
	return false
# --- Private Methods ---
