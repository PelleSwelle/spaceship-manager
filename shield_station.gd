extends StaticBody2D
@onready var interface = $shieldInterface
var isInRange: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isInRange:
		interface.visible = true
	else:
		interface.visible = false

func _on_area_2d_body_entered(body):
	if body.name == 'player':
		isInRange = true
		print('player entered shield station')


func _on_area_2d_body_exited(body):
	isInRange = false
	if (body.name == 'player'):
		print('player exited shield station')
