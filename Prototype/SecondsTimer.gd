extends Label

var time: float = 20.0
var seconds: int = 0

func _process(delta) -> void:
	time -= delta
	seconds = fmod(time, 60)
	if time <= 0:
		self.queue_free()
	self.text = "%02d" % seconds

func stop() -> void:
	set_process(false)

