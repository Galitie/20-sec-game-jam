extends Node

var enemy_array = []
var built = false

func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * Globals.tower_data[self.get_name()]["range"]

func _on_range_area_entered(area):
	enemy_array.append(area.get_parent())


func _on_range_area_exited(area):
	enemy_array.erase(area.get_parent())
