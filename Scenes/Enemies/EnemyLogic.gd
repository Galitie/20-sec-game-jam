extends PathFollow2D

var enemy_speed: int = 150
var hp = 5
var boss = 1

@onready var health_bar = get_node("HealthBar")
@onready var sprite = get_node("Sprite2D")

func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
	health_bar.set_as_top_level(true)
	if boss == 1:
		sprite.texture = load("res://Assets/Enemies/evil_rat.png")
		sprite.scale = Vector2(.20,.20)

		
	
	
func _physics_process(delta):
	if progress_ratio == 1.0:
		var enemies = get_tree().get_nodes_in_group("enemy")
		for enemy in enemies:
			enemy.visible = false
		get_node("/root/Main/Button").visible = true
		get_node("/root/Main/Cello_2").play()
		get_node("/root/Main/CanvasLayer/SecondsTimer").stop()
	else:
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
	#Ben's soundtrack stuff (Note, this one is NOT randomized)
	if boss == 0:
		var defeat_sound = randi() %3
		defeat_sound += 1
		get_node("/root/Main/Woodwind_" + str(defeat_sound)).play()
	#Ben's tower stuff
	if boss == 1:
		get_node("/root/Main/BrassFlourish").play()
		
	

func _on_button_pressed():
	on_hit(10)
	#Ben's Audio:
	var click_sound = randi() %5
	click_sound += 1
	get_node("/root/Main/Click_" + str(click_sound)).play()
	modulate.a -= 0.25

	
	
