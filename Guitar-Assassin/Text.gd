# DialogBox.gd
extends RichTextLabel

var dialog = [
	"Hello Mr. Kaughtabaw, welcome!",
	"This is your test before you enter the League of Magical Assassins.",
	"Collect the strings lying around to use your weapon.",
	"You will need to defeat the enemies that lie ahead...",
	"Be careful, there is a great monster roaming around that you will have to defeat!",
	"Good luck young man!"
	]
var page = 0

func _ready():
	get_parent().hide()
	pass
	
func start_dialog():
	get_parent().show()
	set_bbcode(dialog[page])
	set_visible_characters(0) 		# hide text at start
	set_process_input(true) 		# enable user input


# INPUT logic for dialog box
func _input(event):
	if event is InputEventKey and event.get_scancode() == KEY_SPACE: 	# scan for input
		if event.is_pressed():											# if space key is pressed
			if get_visible_characters() > get_total_character_count():	# if all text for current page printed
				if page < dialog.size()-1:								# if not last page of dialog
					page += 1											# turn page
					set_bbcode(dialog[page])
					set_visible_characters(0)
				else:		
					get_parent().hide()									# Call parent function to hide dialog box
			else:														
				set_visible_characters(get_total_character_count())		
	if event is InputEventKey and event.get_scancode() == KEY_ESCAPE:
		if event.is_pressed():
			get_parent().hide()											# Call parent function hide to hide dialog box

func hide():
	get_parent().hide()

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
