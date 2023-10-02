extends CanvasLayer

@export var chargeRate: float = .4
var currentCharge: float = 0
var fullCharge: float = 100

var isCharging: bool = false
var shieldIsActive: bool = false
var chargeLabel

var shield

var shieldSprite = preload('res://shield.tscn')

func _ready():
	chargeLabel = %chargeLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isCharging:
		if currentCharge < fullCharge:
			currentCharge += 1	
		else:
			isCharging = false
	
	if shieldIsActive:
		if currentCharge > 0:
			shield.play('idle')
			currentCharge -= 1
		else:
			shield.play('close')
			await shield.animation_finished
			shieldIsActive = false
			shield.queue_free()
			
	chargeLabel.text = str(currentCharge)


func _on_charge_button_pressed():
	print('charge pressed')
	if currentCharge < fullCharge:
		isCharging = true
		
	else:
		print('already at full charge')


func _on_deploy_button_pressed():
	print('deploy pressed')
	if currentCharge == fullCharge:
		shield = shieldSprite.instantiate()
		add_child(shield)
		shield.position = Vector2(300, 350)
		shield.play('open')
		shieldIsActive = true
		await shield.animation_finished
		
	else:
		print('cannot deploy shield. No charge')
