extends RichTextLabel

var highscore = 0;
func _ready():
	Signals.connect("updateHighScore",self,"updateHighScore")

func updateHighScore(hscore):
	if hscore > highscore:
		highscore= hscore
		self.text = String(hscore)
