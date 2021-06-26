extends Node2D

# Tween 1 - Hover
onready var sprite1 = $Sprite1
onready var tween1 = $Tween1
onready var tween1_values = [Vector2.ZERO, Vector2.ZERO]

# Tween 2 - Bounce
onready var sprite2 = $Sprite2
onready var tween2 = $Tween2
onready var tween2_values = [Vector2.ZERO, Vector2.ZERO]
onready var tween2_easing = [Tween.EASE_OUT, Tween.EASE_IN]


func _ready() -> void:
	_start_tween1()
	_start_tween2()

# -----------------------------------------------------------------------
# Tween 1 - Hover
# -----------------------------------------------------------------------
func _start_tween1():
	if(tween1_values[0] == Vector2.ZERO):
		tween1_values = [sprite1.global_position, Vector2(sprite1.global_position.x, sprite1.global_position.y - 100)]
	tween1.interpolate_property(sprite1, "position", tween1_values[0], tween1_values[1], 2, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween1.start()	

func _on_Tween1_tween_completed(object: Object, key: NodePath) -> void:
	tween1_values.invert()
	_start_tween1()

# -----------------------------------------------------------------------
# Tween 2 - Bounce 
# -----------------------------------------------------------------------
func _start_tween2():
	if(tween2_values[0] == Vector2.ZERO):
		tween2_values = [sprite2.global_position, Vector2(sprite2.global_position.x, sprite2.global_position.y - 100)]
	tween2.interpolate_property(sprite2, "position", tween2_values[0], tween2_values[1], 1, Tween.TRANS_CUBIC, tween2_easing[0])
	tween2.start()	

func _on_Tween2_tween_completed(object: Object, key: NodePath) -> void:
	tween2_values.invert()
	tween2_easing.invert()
	_start_tween2()


func _on_LinkButton1_pressed() -> void:
	OS.shell_open($LinkButton1.text)


func _on_LinkButton2_pressed() -> void:
	OS.shell_open($LinkButton2.text)
