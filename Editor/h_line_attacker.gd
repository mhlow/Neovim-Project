# @tool
class_name HLineAttacker extends Control 
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
# --- Enums ---
# --- Constants ---
# --- @export Variables ---
@export var _editor_grid : EditorGridContainer
# --- Public Variables ---
# --- Private Variables ---
# --- @onready Variables ---
@onready var attack_timer : Timer = $"Attack Cooldown"

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
# --- Private Methods ---

func _attack_line(line : int) -> void:
	var arr = []
	for i in range(_editor_grid._grid_width):
		arr.append([line, i])
	print(arr)
	_editor_grid.attack_cells(arr)


func _on_attack_cooldown_timeout() -> void:
	_attack_line(randi_range(0, _editor_grid._grid_height - 1))
	attack_timer.start()
