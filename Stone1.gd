extends "res://Scripts/ElementMovement.gd"

func _physics_process(delta):
	move()



func _on_HitObstacle_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("killPlayer")
