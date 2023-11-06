extends Node2D

var sec_between_enemies: float = 1
# enemies are objects, add a object to the array below to add more enemies
# enemies have a default health of 3 and a default speed of 150
var enemies = [ 
	{"hp": 3, "speed": 150},
	{"hp": 3, "speed": 250}
	]


# Called when the node enters the scene tree for the first time.
func _ready():
	start_enemy_wave()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_enemy_wave():
	for i in enemies.size():
		var new_enemy = load('res://Scenes/Enemies/EnemyType1.tscn').instantiate()
		new_enemy.set("enemy_health", enemies[i]["hp"])
		new_enemy.set("enemy_speed", enemies[i]["speed"])
		get_node('EnemyPath').add_child(new_enemy, true)
		await get_tree().create_timer(sec_between_enemies).timeout
		

