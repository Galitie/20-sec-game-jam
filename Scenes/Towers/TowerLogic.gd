extends Node

var enemy_array = []
var built = false
var enemy

func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * Globals.tower_data[self.get_name()]["range"]


func _physics_process(delta):
	if enemy_array.size() !=0 and built:
		select_enemy()
	else:
		enemy = null


func _on_range_area_entered(area):
	enemy_array.append(area.get_parent())


func _on_range_area_exited(area):
	enemy_array.erase(area.get_parent())

# target enemies that are closest to leaving the map
func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.h_offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]
