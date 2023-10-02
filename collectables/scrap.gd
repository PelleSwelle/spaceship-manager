extends Area2D
class_name Scrap

func _on_body_entered(body):
	if body is Ship:
		body.collect(self)
		queue_free()
