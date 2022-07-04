extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var random_obstacle = RandomNumberGenerator.new()
var index = 0
onready var timer = get_node("Timer")
var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():

	if counter%13 != 0:
		var temp = preload("res://Scenes/BasicCrystal.tscn").instance()
		
		add_child_below_node(self,temp)
	elif counter%13 == 0:
		var temp = preload("res://Scenes/PowerCrystal.tscn").instance()
		add_child_below_node(self,temp)
	
	
	counter+=1

	
