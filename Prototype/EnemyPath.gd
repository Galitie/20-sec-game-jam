extends Path2D

@onready var path = self
var idx = 0
var c = Color.RED

# Visually show/draw the path enemies will walk on during runtime
# Optionally show the points and handles by uncommenting the code in line 11-20
func _draw():
	draw_polyline(path.curve.get_baked_points(), c, 1, true)
#	for p in path.curve.get_point_count():
#		if p != 0 and p != path.curve.get_point_count() - 1:
#			draw_circle(path.curve.get_point_position(p), 2, c)
#			draw_circle(path.curve.get_point_position(p) - path.curve.get_point_in(p) * -1, 5, c)
#			draw_circle(path.curve.get_point_position(p) - path.curve.get_point_out(p) * -1, 5, c)
#			var a = path.curve.get_point_position(p) - path.curve.get_point_in(p) * -1
#			var b = path.curve.get_point_position(p) - path.curve.get_point_out(p) * -1
#			var cp = path.curve.get_point_position(p)
#			draw_polyline(PackedVector2Array([a, cp]), c, 1, true)
#			draw_polyline(PackedVector2Array([b, cp]), c, 1, true)
	queue_redraw()
