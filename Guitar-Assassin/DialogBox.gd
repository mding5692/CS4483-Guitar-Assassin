# DialogBox.gd
extends RichTextLabel

var dialog = ["Hello Guitar Assassin, welcome!", "Are you ready to begin your adventure?"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0) 		# hide text at start
	set_process_input(true) 		# enable user input


# TODO
# Remove dialog box after last page
func _input(event):
	if event is InputEventKey and event.get_scancode() == KEY_SPACE: 	# scan for input
		if event.is_pressed():											# if space key is pressed
			if get_visible_characters() > get_total_character_count():	# if all text for current page printed
				if page < dialog.size()-1:								# if not last page of dialog
					page += 1											# turn page
					set_bbcode(dialog[page])
					set_visible_characters(0)
#				else:					
#					$Dialog_Box.visible = not $Dialog_Box.visible

			else:														# 
				set_visible_characters(get_total_character_count())		



func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
