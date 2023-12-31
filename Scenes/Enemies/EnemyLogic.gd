extends PathFollow2D

var enemy_speed: int = 150
var hp = 5

@onready var health_bar = get_node("HealthBar")

func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
	health_bar.set_as_top_level(true)
	
func _physics_process(delta):
	move(delta)

func move(delta):
	set_progress(get_progress() + enemy_speed * delta)
	health_bar.position = position - Vector2(32,40)


func on_hit(damage):
	hp -= damage
	health_bar.value = hp
	if hp <= 0:
		on_destroy()


func on_destroy():
	self.queue_free()


func _on_button_pressed():
	on_hit(1)
