extends Node2D
@onready var timer: Timer = $Timer
var scrapAsset = preload("res://collectables/scrap.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.timeout:
		var scrap: Area2D = scrapAsset.instantiate()
		scrap.position = Vector2(300, 300)
		add_child(scrap)
