extends Node2D

@export var num_enemies: int = 3
@export var time_between_enemies: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	start_enemy_wave()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_enemy_wave():
	for i in num_enemies:
		var new_enemy = load('res://Scenes/Enemies/EnemyType1.tscn').instantiate()
		get_node('EnemyPath').add_child(new_enemy, true)
		await get_tree().create_timer(time_between_enemies).timeout
		

