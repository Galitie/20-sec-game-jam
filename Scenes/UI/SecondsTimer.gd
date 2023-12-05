extends Label

# Set to 21 seconds because the timer doesn't appear for a whole second while loading!
var time: float = 21.0
var seconds: int = 0
var winScreen = preload("res://Scenes/UI/WinScene.tscn")

func _process(delta) -> void:
	time -= delta
	seconds = fmod(time, 60)
	
	if get_node("/root/Main/EnemyPath").get_child_count() == 0:
		set_process(false)
		self.visible = false
		get_node("/root/Main").add_child(winScreen.instantiate())
	elif time < 1:
		set_process(false)
		self.visible = false
		get_node("/root/Main").add_child(winScreen.instantiate())
	else:
		text = "%02d" % seconds

func stop() -> void:
	set_process(false)
	text = "You got distracted..."

