extends Sprite

const velocity: float = -3.0
var g_texture_width: float =0

# Called when the node enters the scene tree for the first time.
func _ready():
	g_texture_width = texture.get_size().x * scale.x


func _process(delta):
		position.x += velocity
		_attemptReposition()
	
func _attemptReposition():
	if position.x< -g_texture_width:
		position.x += 2*g_texture_width
