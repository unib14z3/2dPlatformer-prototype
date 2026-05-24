class_name Player
extends Entity

var is_jumping : bool
var face_direction : int
var move_direction : float :
	set(value):
		move_direction = value
		if value == 0 : return
		else : face_direction = sign(value)
d
func _process(_delta: float) -> void:
	_handle_input()
	_handle_animation()
	_handle_face_dirction()

# Handler Functions 
func _handle_input() -> void:
	move_direction = Input.get_axis("move_left","move_right")
	is_jumping = Input.is_action_just_pressed("jump")

func _handle_animation() -> void:
	if self.velocity.y > 0 : self.animator.play("rise")
	
	if self.velocity.y < 0 : self.animator.play("fall")
	
	if self.velocity.x != 0 and self.velocity.y==0 : self.animator.play("run")
	else : self.animator.play("idle")

func _handle_face_dirction() -> void:
	if face_direction > 0 :
		self.animator.flip_h = false
		self.hitbox.scale.x = 1
	
	elif face_direction < 0 : 
		self.animator.flip_h = true
		self.hitbox.scale.x = -1

func take_damage(_val:float = 0) -> void:
	var dmg : float = stats.calculate_damage(_val)
	stats.apply(dmg)

func die() -> void:
	get_component("movement").disable()
	animator.play("die")
	await animator.animation_finished
	self.queue_free()
	get_tree().reload_current_scene()



# Stats loading 
func get_stat(stat: EntityStats.Stats) -> float:
	match stat:
		EntityStats.Stats.jump_strength:
			return stats.Base_JUMP_STRENGTH
		EntityStats.Stats.speed:
			return stats.Base_SPEED
		_:
			push_error("Unknown stat: %s" % stat)
			return 0.0
