extends Area2D

const string_type = "string2"
var p

func _ready():
	p = get_tree().get_root().find_node("string_popup",true,false).get_child(0)
	pass

func _on_string2_body_entered(body):
	if body.get_name() == "player":
		body.set_attack_ability(string_type)
		p.get_child(0).text = "Red string found. Causes 10 damage points. \nPress 2 to use."
		p.popup_centered()
		queue_free()
		get_tree().paused = true
