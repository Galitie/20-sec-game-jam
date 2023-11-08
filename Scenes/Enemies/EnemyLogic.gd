extends PathFollow2D

<<<<<<< HEAD
var enemy_speed: int = 150
var hp = 5

@onready var health_bar = get_node("HealthBar")

func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
=======
@export_category("Enemy Variables")
@export var enemy_health: int = 3
@export var enemy_speed: int = 150
>>>>>>> parent of 6c6634e (can now destroy enemies)

func _process(delta):
	pass
	# if enemy_health <= 0:
	# die
	
func _physics_process(delta):
	move(delta)

func move(delta):
	set_progress(get_progress() + enemy_speed * delta)

<<<<<<< HEAD

func on_hit(damage):
	hp -= damage
	health_bar.value = hp
	if hp <= 0:
		on_destroy()


func on_destroy():
	self.queue_free()
=======
>>>>>>> parent of 6c6634e (can now destroy enemies)
