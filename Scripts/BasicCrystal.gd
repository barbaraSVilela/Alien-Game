extends "res://Scripts/ElementMovement.gd"

func _physics_process(delta):
	move()




func _on_GrabCrystal_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("rewardPlayer",1)
		queue_free()
