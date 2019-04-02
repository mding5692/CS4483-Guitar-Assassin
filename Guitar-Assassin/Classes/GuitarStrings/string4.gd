extends Area2D


const string_type = "string4"
var p

func _ready():
	p = get_tree().get_root().find_node("string_popup",true,false).get_child(0)
	pass

func _on_string4_body_entered(body):
	if body.get_name() == "player":
		body.set_attack_ability(string_type)
		p.get_child(0).text = "Green string found. Causes 20 damage points. \nPress 4 to use."
		p.popup_centered()
		queue_free()
		get_tree().paused = true
