class_name  Entity
extends CharacterBody2D
@onready var health : float = 100.0
@onready var animator : AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox : Area2D = $Hitbox

# declare property components here
# eg movement, attack, gravity, dash etc..... 

#assign values to property variables here
#func _ready() -> void:
#	animator = $AnimatedSprite2D
#	hitbox = $Hitbox

func die() -> void :
	push_error("die() not implimented")

func get_health() -> float :
	return health

func take_damage(val:float = 10.0) -> void:
	push_error("take_damage() not implimented")
