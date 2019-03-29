# DialogBox.gd
extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b =  "textvar"
var dialog = ["Hello Guitar Assassin, welcome!", "Are you ready to begin your adventure?"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0) 		# hide text at start
	set_process_input(true) 		# enable user input
	
#func _input(event):
#	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
#		if get_visible_characters() > get_total_character_count():
#			if page < dialog.size() -1:
#				page += 1
#				set_bbcode(dialog[page])
#				set_visible_characters(0)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
