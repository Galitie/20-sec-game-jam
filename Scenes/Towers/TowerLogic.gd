extends Node

var type
var enemy_array = []
var built = false
var enemy
var ready_to_fire = true


func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * Globals.tower_data[type]["range"]


func _physics_process(delta):
	if enemy_array.size() !=0 and built:
		select_enemy()
		if ready_to_fire:
			fire()
	else:
		enemy = null


func _on_range_area_entered(area):
	if area.is_in_group("enemy"):
		enemy_array.append(area.get_parent())


func _on_range_area_exited(area):
	if area.is_in_group("enemy"):
		enemy_array.erase(area.get_parent())

# target enemies that are closest to leaving the map
func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.h_offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]

func fire():
	ready_to_fire = false
	enemy.on_hit(Globals.tower_data[type]["damage"])
	await(get_tree().create_timer(Globals.tower_data[type]["firerate"]).timeout)
	ready_to_fire = true
