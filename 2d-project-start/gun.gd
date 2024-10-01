extends Area2D
var enemies_in_range
var target_enemy
func _physics_process(delta):
	enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet= BULLET.instantiate()
	new_bullet.global_position = %shoot_point.global_position
	new_bullet.global_rotation = %shoot_point.global_rotation
	
	%shoot_point.add_child(new_bullet)


func _on_timer_timeout() -> void:
	shoot()
