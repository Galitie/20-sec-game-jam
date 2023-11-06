extends PathFollow2D

@export_category("Enemy Variables")
@export var enemy_health: int = 3
@export var enemy_speed: int = 150

func _process(delta):
	pass
	# if enemy_health <= 0:
	# die
	
func _physics_process(delta):
	move(delta)

func move(delta):
	set_progress(get_progress() + enemy_speed * delta)

