# @tool
class_name CodeEditorSyntaxHighlighter extends CodeHighlighter
# # docstring

# =============================================================
# Class Declarations
# =============================================================
# --- Signals ---
# --- Enums ---
# --- Constants ---
# EXTRACT THIS OUT TO A CODEHIGHLIGHTING FILE
const NUMBER_COLOR : Color = Color("#74bf28")
const SYMBOL_COLOR : Color = Color("#359dbd")
const FUNCTION_COLOR : Color = Color("#1c63d6")
const MEMBER_VARIABLE_COLOR : Color = Color("#09b576")

const VARIABLE_COLOR : Color = Color("#3d62f5")
const STRING_COLOR : Color = Color("#e09f2d")
const KEYWORD_COLOR : Color = Color("#ff7085")
const KEYWORDS : Array[String] = ["if", "and", "class", "func"]

# https://atelierbram.github.io/syntax-highlighting/atelier-schemes/seaside/
#$base00: hsl(120, 5%, 8%);    /* #131513; */
#$base01: hsl(120, 6%, 15%);   /* #242924; */
#$base02: hsl(120, 8%, 40%);   /* #5e6e5e; */
#$base03: hsl(120, 9%, 45%);   /* #687d68; */
#$base04: hsl(120, 11%, 55%);  /* #809980; */
#$base05: hsl(120, 13%, 60%);  /* #8ca68c; */
#$base06: hsl(120, 35%, 86%);  /* #cfe8cf; */
#$base07: hsl(120, 50%, 97%);  /* #f4fbf4; */
#$base08: hsl(350, 80%, 50%);  /* #e6193c; */
#$base09: hsl(48, 65%, 32%);   /* #87711d; */
#$base0a: hsl(60, 70%, 35%);   /* #98981b; */
#$base0b: hsl(120, 60%, 40%);  /* #29a329; */
#$base0c: hsl(190, 75%, 40%);  /* #1999b3; */
#$base0d: hsl(228, 95%, 63%);  /* #3d62f5; */
#$base0e: hsl(280, 85%, 55%);  /* #ad2bee; */
#$base0f: hsl(310, 80%, 50%);  /* #e619c3; */
#
#$red:     $base08;
#$orange:  $base09;
#$yellow:  $base0a;
#$green:   $base0b;
#$cyan:    $base0c;
#$blue:    $base0d;
#$violet:  $base0e;
#$magenta: $base0f;

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
	self.number_color = NUMBER_COLOR
	self.symbol_color = SYMBOL_COLOR
	self.function_color = FUNCTION_COLOR
	self.member_variable_color = MEMBER_VARIABLE_COLOR
	

func _enter_tree() -> void:
	pass

func _process(delta: float) -> void:
	pass

# --- Public Methods ---
# --- Private Methods ---
