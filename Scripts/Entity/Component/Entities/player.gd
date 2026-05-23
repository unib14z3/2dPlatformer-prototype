class_name Player
extends Entity

func take_damage(_val:float = 0) -> void:
	var dmg : float = stats.calculate_damage(_val)
	stats.apply(dmg)

func die() -> void:
	get_component("movement").disable()
	animator.play("die")
	await animator.animation_finished
	self.queue_free()
	get_tree().reload_current_scene()

func get_health():
	pass
# Core Components:
func get_speed() -> float: 
	return stats.Base_SPEED

func get_attack() -> float:
	return stats.Base_ATTACK

func get_jump_strength() -> float:
	return stats.Base_JUMP_STRENGTH
