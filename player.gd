extends KinematicBody

var dir = Vector3()
var vel = Vector3()

func _process(delta):
	dir = Vector3()
	if Input.is_key_pressed(KEY_D):
		dir.x += delta
	if Input.is_key_pressed(KEY_A):
		dir.x -= delta
		
	dir.normalized()
	var ovel = vel
	vel = vel.linear_interpolate(dir * 400,20 * delta)
	vel.y = ovel.y
	
	move_and_slide(vel + get_floor_velocity(),Vector3(0,1,0))
	
	if is_on_floor():
		if Input.is_key_pressed(KEY_W):
			vel.y = 15
		else:
			vel.y = 0
	else:
		vel.y  += (delta * -30)	
		if get_global_transform().origin.y < -20:
			get_tree().reload_current_scene()