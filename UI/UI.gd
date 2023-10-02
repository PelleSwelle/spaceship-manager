extends CanvasLayer
class_name UI

@onready var scrap_label: Label = $Control/MarginContainer/VBoxContainer/HBoxContainer/score

var scrapCount = 0:
	set(new_scrap):
		scrapCount = new_scrap
		update_scrap_label()

func _ready():
	update_scrap_label()
		
func update_scrap_label():
	scrap_label.text = str(scrapCount)

func _on_collected(scrap) -> void:
	if scrap:
		scrapCount += 100
