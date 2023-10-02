extends Node2D
class_name Ship

signal collected(Scrap)
var move_speed: float = 2
func collect(scrap):
	collected.emit(scrap)

func _process(delta):
	if Input.is_key_pressed(KEY_W):
		position.y -= 1 * move_speed
	elif Input.is_key_pressed(KEY_S):
		position.y += 1 * move_speed
	if Input.is_key_pressed(KEY_A):
		position.x -= 1 * move_speed
	if Input.is_key_pressed(KEY_D):
		position.x += 1 * move_speed
