extends Node2D

### ------------------ ###
###     EDIT ME!
### vvvvvvvvvvvvvvvvvv ###

var sec_between_enemies = 1
# enemies and towers are objects, add an object to the arrays below to add more
# enemies have a default health of 3 and a default speed of 150
# they will spawn in order from the start of the array to the end
var enemies = [ 
	{"hp": 3, "speed": 150},
	{"hp": 3, "speed": 250},
	{"hp": 3, "speed": 100},
]

# only 3 towers available for prototype, don't add more but feel free to change the values
var towers = [
	{"atkdamage": 1, "atkspeed": 300},
	{"atkdamage": 2, "atkspeed": 250},
	{"atkdamage": 3, "atkspeed": 100},
]

### ^^^^^^^^^^^^^^^^^^ ###
###      EDIT ME!
### ------------------ ###

var build_mode = false
var build_location
var build_type
var build_valid
var build_tile


func _ready():
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.pressed.connect(initiate_build_mode.bind(i.name))
	start_enemy_wave()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if build_mode:
		update_tower_preview()


func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
		cancel_build_mode()


func initiate_build_mode(tower_type):
	build_type = tower_type
	build_mode = true
	get_node("CanvasLayer").set_tower_preview(build_type, get_global_mouse_position())


func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_tile = get_node("TowerExclusion").local_to_map(mouse_position)
	var tile_position = get_node("TowerExclusion").map_to_local(current_tile)
	
	if get_node("TowerExclusion").get_cell_source_id(0, current_tile) == -1:
		get_node("CanvasLayer").update_tower_preview(tile_position, "#14FF0084")
		build_valid = true
		build_location = tile_position
		build_tile = current_tile
	else:
		get_node("CanvasLayer").update_tower_preview(tile_position, "#FF150044")
		build_valid = false


func cancel_build_mode():
	build_mode = false
	build_valid = false
	get_node("CanvasLayer/TowerPreview").queue_free()


func verify_and_build():
	if build_valid:
		var new_tower = load("res://Scenes/Towers/" + build_type + ".tscn").instantiate()
		new_tower.global_position = build_location
		get_node("TowerContainer").add_child(new_tower, true)
		get_node("TowerExclusion").set_cell(0, build_tile, 2, Vector2i(0,0))


func start_enemy_wave():
	for i in enemies.size():
		var new_enemy = load('res://Scenes/Enemies/EnemyType1.tscn').instantiate()
		new_enemy.set("enemy_health", enemies[i]["hp"])
		new_enemy.set("enemy_speed", enemies[i]["speed"])
		get_node('EnemyPath').add_child(new_enemy, true)
		await get_tree().create_timer(sec_between_enemies).timeout
		

