extends PathFollow2D

var enemy_speed: int = 150
var hp = 5


func _physics_process(delta):
	move(delta)


func move(delta):
	set_progress(get_progress() + enemy_speed * delta)


func on_hit(damage):
	hp -= damage
	if hp <= 0:
		on_destroy()


func on_destroy():
	self.queue_free()
