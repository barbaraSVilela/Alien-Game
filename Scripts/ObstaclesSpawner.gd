extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var random_obstacle = RandomNumberGenerator.new()
var obstaclesGenerated = 0
var index = 0
onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	random_obstacle.randomize()
	index = random_obstacle.randi_range(0,3)
	if obstaclesGenerated >= 20:
		index = random_obstacle.randi_range(0,3)
	else: 
		index = random_obstacle.randi_range(0,1)

	 
	
	if index == 0:
		var temp = preload("res://Scenes/Seaweed.tscn").instance()
		add_child_below_node(self,temp)
		timer.wait_time = 1.0
	elif index==1:
		var temp = preload("res://Scenes/Barrel.tscn").instance()
		add_child_below_node(self,temp)
		timer.wait_time = 1.0
	elif index==2:
		var temp = preload("res://Scenes/Mast.tscn").instance()
		add_child_below_node(self,temp)
		timer.wait_time = 1.5
	elif index==3:
		var temp = preload("res://Scenes/Stone.tscn").instance()
		add_child_below_node(self,temp)
		timer.wait_time = 1.0
	
	obstaclesGenerated += 1
