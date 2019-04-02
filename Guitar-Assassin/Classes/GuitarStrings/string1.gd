extends Area2D

const string_type = "string1"
var p

func _ready():
	p = get_tree().get_root().find_node("string_popup",true,false).get_child(0)
	print(p.get_name())
	pass

func _on_guitar_string_body_entered(body):
	if body.get_name() == "player":
		body.set_attack_ability(string_type)
		p.get_child(0).text = "Blue string found. Causes 5 damage points. \nPress 1 to use."
		p.popup_centered()
		queue_free()
