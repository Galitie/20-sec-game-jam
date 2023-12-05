extends PathFollow2D

var enemy_speed: int = 150
var hp = 5
var type = 0
var dead = false


@onready var sprite = get_node("Sprite2D")

func _ready():
	pass
	
	
func _physics_process(delta):
	if progress_ratio == 1.0 && !dead:
		var enemies = get_tree().get_nodes_in_group("enemy")
		for enemy in enemies:
			enemy.visible = false
		get_node("/root/Main/Button").visible = true
		get_node("/root/Main/CanvasLayer/SecondsTimer").stop()
	else:
		move(delta)


func move(delta):
	set_progress(get_progress() + enemy_speed * delta)



func on_hit(damage):
	hp -= damage
	if hp <= 0:
		on_destroy()


func on_destroy():
	dead = true
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "rotation_degrees", 360, .75)
	tween.tween_property(self, "position", Vector2(randi_range(0, 1440), randi_range(-720, 720)), .75).from_current()
	if type == 1:
		var defeat_sound = randi() %3
		defeat_sound += 1
		get_node("/root/Main/Woodwind_" + str(defeat_sound)).play()

	if type == 2:
		get_node("/root/Main/BrassFlourish").play()
	await tween.finished
	self.queue_free()	
	

func _on_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.15,1.15), .05)
	tween.tween_property(self, "scale", Vector2(1,1), .05).set_ease(Tween.EASE_OUT)
	on_hit(10)
	var click_sound = randi() %5
	click_sound += 1
	get_node("/root/Main/Click_" + str(click_sound)).play()
	

	
	
