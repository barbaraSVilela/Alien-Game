extends KinematicBody2D

var velocity = Vector2.ZERO
export var jump_velocity = 500.0
export var gravity_scale = 20.0
var canJump = true
var doubleJump = 2
onready var animation = $AnimatedSprite

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("run")
	Signals.connect("rewardPlayer",self,"rewardPlayer")
	Signals.connect("killPlayer",self,"killPlayer")

func _physics_process(delta):
	velocity.y += gravity_scale
	move_and_collide(velocity*delta)
	
func _input(event):
	if event.is_action_pressed("jump"):
		if doubleJump > 0:
			velocity = Vector2.ZERO
			velocity.y -= jump_velocity
			animation.play("jump")
			doubleJump = doubleJump - 1




func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		canJump = true
		doubleJump=2
		animation.play("run")
	


func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		canJump= false

func rewardPlayer(scoreToAdd):
	score+=scoreToAdd
	Signals.emit_signal("updateScore",score)

func killPlayer():
	queue_free()
