extends Label

# Set to 21 seconds because the timer doesn't appear for a whole second while loading!
var time: float = 21.0
var seconds: int = 0

func _process(delta) -> void:
	time -= delta
	seconds = fmod(time, 60)
	
	if get_node("/root/Main/EnemyPath").get_child_count() == 0:
		stop()
		get_node("/root/Main/Button").visible = true
		text = "You've reached Meowvana!"
	elif time < 1:
		stop()
		get_node("/root/Main/Button").visible = true
		text = "You've reached Meowvana!"
	else:
		text = "%02d" % seconds

func stop() -> void:
	set_process(false)
	text = "You got distracted..."

