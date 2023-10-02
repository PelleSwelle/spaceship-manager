extends Node2D
class_name Game

@export var ship: Ship
@export var ui: UI

func _ready():
	if !ship.collected.is_connected(ui._on_collected):
		ship.collected.connect(ui._on_collected)
