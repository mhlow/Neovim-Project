# @tool
class_name VisualEditor extends VBoxContainer 
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
# --- Enums ---
enum Mode {
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
var last_vertical : bool = false
var last_vertical_caret_pos : Vector2i = Vector2i(0,0)
# --- Private Variables ---
var _mode : Mode = Mode.NORMAL
var _caret_pos : Vector2i = Vector2i(0,0)
var _hidden_editor_caret : Vector2i = Vector2i(0,0)
# --- @onready Variables ---
@onready var _editor_grid : EditorGridContainer = $"Screen Grid"
@onready var _key_press_handler : KeyPressHandler = $"Key Press Handler"
@onready var _hidden_editor : CodeEdit = $"Hidden Editor"

# =============================================================
# Methods
# =============================================================
# --- Initialisations ---
func _ready() -> void:
	while _hidden_editor.text.split("\n").size() < _editor_grid.get_grid_dims().y:
		_hidden_editor.text += "\n"
	print(_hidden_editor.text.split("\n").size())
	_editor_grid.set_text(_hidden_editor.text)

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

func update_caret() -> void:
	_hidden_editor_caret = Vector2i(_hidden_editor.get_caret_column(), _hidden_editor.get_caret_line())
	#if _valid_pos(_hidden_editor_caret):
		#_editor_grid.select_insert_character_box(_hidden_editor_caret)
	#else:
		#pass

func update_text() -> void:
	_editor_grid.set_text(_hidden_editor.text)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Escape"):
		# this could go wrong if on the edge of the page
		#if _mode == Mode.INSERT:
			#if _valid_pos(_hidden_editor_caret):
				#_caret_pos = _hidden_editor_caret
			#else:
				#_caret_pos = Vector2i(0,0)
				#
			#_hidden_editor.release_focus()
		
		#_editor_grid.select_character_box(_caret_pos, _caret_pos)
		set_mode(Mode.NORMAL)
	
	match _mode:
		Mode.NORMAL:
			_key_press_handler.vim_input(event)
	#if _mode == Mode.INSERT:
		#_hidden_editor.editable = true
		#handle_insert_mode(event)
	#else:


# --- Public Methods ---
func set_caret_pos(new_pos : Vector2i) -> bool:
	if not _valid_pos(new_pos):
		_play_error_sound()
		return false
	
	var line : String = _editor_grid.get_text().split("\n")[new_pos.y]
	new_pos.x = min(new_pos.x, max(line.length() - 1, 0))
	
	_editor_grid.select_character_box(_caret_pos, new_pos)
	_caret_pos = new_pos
	print(_caret_pos)
	return true

#func enter_insert_mode(new_pos : Vector2i) -> void:
	#_hidden_editor.text = _editor_grid.get_text()
	#_hidden_editor.set_caret_column(new_pos.x)
	#_hidden_editor.set_caret_line(new_pos.y)
	#_hidden_editor.editable = false
	#_hidden_editor.grab_focus()
	#_mode = Mode.INSERT

func get_caret_pos() -> Vector2i:
	return _caret_pos

func get_hidden_editor() -> CodeEdit:
	return _hidden_editor

#func handle_insert_mode(event : InputEvent) -> void:
	#var char_box : Label = _editor_grid.get_character_box(_caret_pos)
	# do something

func set_mode(mode : Mode) -> void:
	_mode = mode
	print("Changed mode: ", Mode.keys()[mode])

func get_mode() -> Mode:
	return _mode

func get_text() -> String:
	return _editor_grid.get_text()

func get_grid_container() -> EditorGridContainer:
	return _editor_grid

# --- Private Methods ---
func _valid_pos(pos : Vector2i) -> bool:
	return _editor_grid.valid_pos(pos)

func _play_error_sound() -> void:
	print("Played error sound")
