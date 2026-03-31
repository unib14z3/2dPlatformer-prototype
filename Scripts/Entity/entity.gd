@abstract class_name Entity
extends CharacterBody2D

# Core Components
@onready var animator : AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox : Area2D = $Hitbox
@export var stats : EntityStats

# Property Components
@onready var components : Array[Component]

# Stats
@onready var health : float = 100.0

func _ready() -> void:
	print("getting propperties")
	var properties = get_node_or_null("properties")
	if properties == null:
		push_warning("No 'properties' node found on: " + name)
		return

	for c in properties.get_children() :
		if c is Component: 
			c.init(self)
			print("component : ", c.name," is set")
			components.append(c)

func _physics_process(delta: float) -> void:
	for c in components : if c is Component : c.process(delta)
	move_and_slide()

func get_component(cName: String) -> Component:
	for c in components : if c.name == cName : return c
	return null

func get_health() -> float :
	return health

# Stat Methods
@abstract func die() -> void 
@abstract func take_damage(_val:float = 0 ) -> void
