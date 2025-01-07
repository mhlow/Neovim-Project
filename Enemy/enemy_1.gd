# @tool
class_name Enemy1 extends AnimatedSprite2D 
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
signal attack1
# --- Enums ---
# --- Constants ---
# --- @export Variables ---
# --- Public Variables ---
# --- Private Variables ---
# --- @onready Variables ---
@onready var _attackTimer1 = $AttackTimer1

# =============================================================
# Methods
# =============================================================
# --- Initialisations ---
func _ready() -> void:
	_attackTimer1.start()
	pass

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
# --- Private Methods ---


func _on_attack_timer_1_timeout() -> void:
	emit_signal("attack1", )
