extends MarginContainer

onready var number_label =get_node("HBoxContainer/Bars/Life_Bar/Count/Background/Number")
onready var bar = get_node("HBoxContainer/Bars/Life_Bar/Gauge")
onready var tween = $Tween
var player_max_health = 10

var animated_health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	bar.max_value = player_max_health
	update_health(player_max_health)

func _on_player_health_changed(hp):
	update_health(hp)

func update_health(new_value):
	number_label.text = str(new_value)
	bar.value = new_value

