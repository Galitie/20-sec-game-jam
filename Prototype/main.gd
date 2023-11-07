extends Node2D

var sec_between_enemies = 1

var build_mode = false
var build_location
var build_type

# enemies are objects, add a object to the array below to add more enemies
# enemies have a default health of 3 and a default speed of 150
# they will spawn in order from the start of the array to the end
var enemies = [ 
	{"hp": 3, "speed": 150},
	{"hp": 3, "speed": 250},
	{"hp": 3, "speed": 100},
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.pressed.connect(initiate_build_mode.bind(i.name))
	start_enemy_wave()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if build_mode:
		update_tower_preview()


func initiate_build_mode(tower_type):
	build_type = tower_type
	build_mode = true
	get_node("CanvasLayer").set_tower_preview(build_type, get_global_mouse_position())


func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	get_node("CanvasLayer").update_tower_preview(mouse_position, "#14FF0084")
	build_location = mouse_position


func cancel_build_mode():
	pass


func start_enemy_wave():
	for i in enemies.size():
		var new_enemy = load('res://Scenes/Enemies/EnemyType1.tscn').instantiate()
		new_enemy.set("enemy_health", enemies[i]["hp"])
		new_enemy.set("enemy_speed", enemies[i]["speed"])
		get_node('EnemyPath').add_child(new_enemy, true)
		await get_tree().create_timer(sec_between_enemies).timeout
		

