extends RichTextLabel

var dia = ["Now you learn how to use Guitar's abilities.  The new journey awaits ahead. Go for it! Show the world the BEST Guitar Assassin"]
var page = 0
func _ready():
	set_bbcode(dia[page])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
