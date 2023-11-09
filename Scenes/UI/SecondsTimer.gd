extends Label

# Set to 21 seconds because the timer doesn't appear for a whole second while loading!
var time: float = 21.0
var seconds: int = 0

func _process(delta) -> void:
	time -= delta
	seconds = fmod(time, 60)
	
	if time < 1:
		text = "Time's up!"
		stop()
	else:
		text = "%02d" % seconds

func stop() -> void:
	set_process(false)

