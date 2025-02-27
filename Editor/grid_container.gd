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
var _caret_pos : Vector2i = Vector2i(0,0)
# --- @onready Variables ---
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
	
	# Add all the CharacterBoxs
	for i in range(_grid_height):
		var new_row : Array[CharacterBox]
		_character_boxes.append(new_row)
		for j in range(_grid_width):
			var new_cell : CharacterBox = _editor_character_box.instantiate()
			new_cell.connect("game_over", _game_over)
			add_child(new_cell)
			_character_boxes[i].append(new_cell)
	_character_boxes[0][0].set_state(CharacterBox.State.SELECTED)
	
	# why the fuck is this required
	render_screen()
	

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

#func valid_insert_pos(pos : Vector2i) -> bool:
	#if pos.x >= 0 and pos.x < _grid_width + 1:
		#if pos.y >= 0 and pos.y < _grid_height:
			#return true
	#return false

func render_screen() -> void:
	for y in range(_grid_height):
		for x in range(_grid_width):
			var char_box : CharacterBox = _character_boxes[y][x]
			char_box.set_state(CharacterBox.State.DEFAULT)
	_character_boxes[_caret_pos.y][_caret_pos.x].set_state(CharacterBox.State.SELECTED)
	
#func select_insert_character_box(new_pos : Vector2i) -> void:
	#for i in range(_grid_height):
		#for j in range(_grid_width):
			#var char_box : Label = _character_boxes[i][j]
			#char_box.label_settings = _editor_character_label_default
			#char_box.remove_theme_stylebox_override("normal")
			#char_box.add_theme_stylebox_override("normal", _editor_character_box_default)
	#
	## New cell
	#var char_box : Label = _character_boxes[new_pos.y][new_pos.x]
	#char_box.label_settings = _editor_character_label_default
	#char_box.remove_theme_stylebox_override("normal")
	#char_box.add_theme_stylebox_override("normal", _editor_character_box_insert_left)

#func get_character_box(pos : Vector2i) -> Label:
	#var char_box : Label = _character_boxes[pos.y][pos.x]
	#return char_box

# Gets the text of the screen, returning it as a string
func get_text() -> String:
	var return_string : String = ""
	for char_line in _character_boxes:
		for char_box : CharacterBox in char_line:
			return_string += char_box.text
		return_string += "\n"
	#print(return_string)
	return return_string

# Sets the text of the screen, given a paragraph of text. 
# It does not print text which is longer than the grid width, nor
# greater than the grid height.
func set_text(text : String) -> void:
	var text_array : PackedStringArray = text.split("\n")
	text_array = text_array.slice(0, _grid_height)
	for line_index in range(_grid_height):
		if line_index < text_array.size():
			# Setting actual text
			var line : String = _pad_and_cut_string_to_60(text_array[line_index])
			for character_index in range(_grid_width):
				var char_box : CharacterBox = _character_boxes[line_index][character_index]
				if character_index < line.length():
					char_box.text = line[character_index]
				else:
					char_box.text = ""
		else:
			# filling the rest with blank
			for character_index in range(_grid_width):
				_character_boxes[line_index][character_index].text = ""

func get_grid_dims() -> Vector2i:
	return Vector2i(_grid_width, _grid_height)

func get_caret_pos() -> Vector2i:
	return _caret_pos

func set_caret_pos(new_pos : Vector2i) -> bool:
	_character_boxes[_caret_pos.y][_caret_pos.x].set_state(CharacterBox.State.DEFAULT)
	_character_boxes[new_pos.y][new_pos.x].set_state(CharacterBox.State.SELECTED)
	_caret_pos = new_pos
	return true

func attack_cells(cells : Array) -> void:
	for cell in cells:
		_character_boxes[cell[0]][cell[1]].set_state(CharacterBox.State.CHARGINGATTACK)

# --- Private Methods ---
func _pad_and_cut_string_to_60(input_string: String) -> String:
	#if input_string.length() < _grid_width:
		#return input_string + " ".repeat(_grid_width - input_string.length())
	return input_string.substr(0, _grid_width)

func _game_over() -> void:
	print("Game Over")
