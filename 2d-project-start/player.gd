extends CharacterBody2D
var direction
var health = 100.0
signal health_depleted
func _physics_process(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 400
	move_and_slide()
	
	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()
	else:
		get_node("HappyBoo").play_idle_animation()
	const DAMAGE_RATE = 25
	var overlapping_mobs = %hurt_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0:
			health_depleted.emit()
			
