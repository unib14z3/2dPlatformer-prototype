class_name Player
extends Entity

# Declare the property variables here 
@onready var gravity : GravityComponent = $properties/gravity
@onready var movement : MovementComponent = $properties/movement
@onready var attack : AttackComponent = $properties/attack


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for component in $properties.get_children():
		component.init(self)
		print(component, " set")

func _physics_process(delta: float) -> void:
	gravity.process(delta)
	movement.process(delta)
	attack.process()
	move_and_slide()

func die() -> void:
	movement.disable()
	animator.play("die")
	await animator.animation_finished
	self.queue_free()
	get_tree().reload_current_scene()
