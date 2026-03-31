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
