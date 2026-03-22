class_name Dummy
extends Entity

# declare property components here
# eg movement, attack, gravity, dash etc..... 

func _process(delta: float) -> void:
	if get_health() <= 0 :
		die()
		

func die() -> void :
	#animator.play("die")
	#await animator.animation_finished
	self.queue_free()
	spawn(self.position)

func take_damage(val: float = 10) -> void:
	animator.play("damaged")
	self.health -= val
	print("taking damaged, current health : ", get_health())

func spawn(pos : Vector2):
	#spawn dummy
	#play spawn animation
	pass
