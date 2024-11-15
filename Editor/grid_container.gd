# @tool
class_name EditorGridContainer extends GridContainer 
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
# --- Enums ---
# --- Constants ---
const _grid_width : int = 60
const _grid_height : int = 12
const _total_cells : int = _grid_height * _grid_width
# --- @export Variables ---
# --- Public Variables ---
# --- Private Variables ---
var _character_boxes : Array[Array]
# --- @onready Variables ---
@onready var _editor_character_box_default : StyleBox = preload("res://Editor/editor_character_box_default.tres")
@onready var _editor_character_box_selected : StyleBox = preload("res://Editor/editor_character_box_selected.tres")
@onready var _editor_character_box_insert_left : StyleBox = preload("res://Editor/editor_character_box_insert_left.tres")

@onready var _editor_character_label_default : LabelSettings = preload("res://Editor/editor_character_label_default.tres")
@onready var _editor_character_label_selected : LabelSettings = preload("res://Editor/editor_character_label_selected.tres")
@onready var _editor_character_box : PackedScene = preload("res://Editor/editor_character_box.tscn")

# =============================================================
# Methods
# =============================================================
# --- Initialisations ---
func _ready() -> void:
	# Can do this in the inspector as well
	columns = _grid_width
	add_theme_constant_override("h_separation", 0)
	add_theme_constant_override("v_separation", 0)
	
	# Add all the labels
	for i in range(_grid_height):
		var new_row : Array[Label]
		_character_boxes.append(new_row)
		for j in range(_grid_width):
			var new_cell : Label = _editor_character_box.instantiate()
			
			new_cell.add_theme_stylebox_override("normal", _editor_character_box_default)
			new_cell.label_settings = _editor_character_label_default
			
			add_child(new_cell)
			_character_boxes[i].append(new_cell)
			
	var top_left : Label = _character_boxes[0][0]
	top_left.add_theme_stylebox_override("normal", _editor_character_box_selected)
	top_left.label_settings = _editor_character_label_selected

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
func valid_pos(pos : Vector2i) -> bool:
	if pos.x >= 0 and pos.x < _grid_width:
		if pos.y >= 0 and pos.y < _grid_height:
			return true
	return false

func valid_insert_pos(pos : Vector2i) -> bool:
	if pos.x >= 0 and pos.x < _grid_width + 1:
		if pos.y >= 0 and pos.y < _grid_height:
			return true
	return false

func select_character_box(old_pos : Vector2i, new_pos : Vector2i) -> void:
	# Old cell
	var char_box : Label = _character_boxes[old_pos.y][old_pos.x]
	char_box.label_settings = _editor_character_label_default
	char_box.remove_theme_stylebox_override("normal")
	char_box.add_theme_stylebox_override("normal", _editor_character_box_default)
	
	# New cell
	char_box = _character_boxes[new_pos.y][new_pos.x]
	char_box.label_settings = _editor_character_label_selected
	char_box.remove_theme_stylebox_override("normal")
	char_box.add_theme_stylebox_override("normal", _editor_character_box_selected)

func select_insert_character_box(new_pos : Vector2i) -> void:
	for i in range(_grid_height):
		for j in range(_grid_width):
			var char_box : Label = _character_boxes[i][j]
			char_box.label_settings = _editor_character_label_default
			char_box.remove_theme_stylebox_override("normal")
			char_box.add_theme_stylebox_override("normal", _editor_character_box_default)
	
	# New cell
	var char_box : Label = _character_boxes[new_pos.y][new_pos.x]
	char_box.label_settings = _editor_character_label_default
	char_box.remove_theme_stylebox_override("normal")
	char_box.add_theme_stylebox_override("normal", _editor_character_box_insert_left)

func get_character_box(pos : Vector2i) -> Label:
	var char_box : Label = _character_boxes[pos.y][pos.x]
	return char_box

func get_text() -> String:
	var return_string : String = ""
	for char_line in _character_boxes:
		for char_box : Label in char_line:
			return_string += char_box.text
		return_string += "\n"
	print(return_string)
	return return_string

func set_text(text : String) -> void:
	var text_array : PackedStringArray = text.split("\n")
	text_array = text_array.slice(0, _grid_height)
	for line_index in range(text_array.size()):
		var line : String = _pad_and_cut_string_to_60(text_array[line_index])
		print("Lenrskjthgrkjdst ", line.length())
		for character_index in range(line.length()):
			var char_box : Label = _character_boxes[line_index][character_index]
			char_box.text = line[character_index]
			
# --- Private Methods ---
func _pad_and_cut_string_to_60(input_string: String) -> String:
	#if input_string.length() < _grid_width:
		#return input_string + " ".repeat(_grid_width - input_string.length())
	return input_string.substr(0, _grid_width)
