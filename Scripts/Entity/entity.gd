@abstract class_name Entity
extends CharacterBody2D

# Stat Methods
@abstract func get_stat(stat) -> float
@abstract func die() -> void 
@abstract func take_damage(_val:float = 0 ) -> void

# Core Components
@onready var animator : AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox : Area2D = $Hitbox
@export var stats : EntityStats

# Property Components
@export var properties_folder : Node
@onready var components : Array[Component]

# Buffs Yet to be added to the Entity, but will be used to store active buffs and their effects.
@export var buffs : Node


## Loads Components present under the Properties Node.
## [br]
## [b]param:[/b] [code]properties[/code] - The parent Node containing the components.
func _load_components(properties) -> void :
	for c in properties.get_children() :
		if c is Component: 
			c.init(self)
			print("component : ", c.name," is set")
			components.append(c)


func _property_setup_fallback() -> Node:
	var _prop_folder = get_node_or_null("properties")
	return _prop_folder


# Life Cycle Methods 
func _ready() -> void:
	if properties_folder == null:
		properties_folder = _property_setup_fallback()
	
	if properties_folder == null:
		push_error("No 'properties' node found on: " + name)
		return
	
	_load_components(properties_folder)


func _physics_process(delta: float) -> void:
	for c in components : if c is Component : c.process(delta)
	move_and_slide()


## Searches for and returns a component by its node name.
## [br]
## Returns [code]null[/code] and prints a warning if no matching component is found.
## [br]
## [b]param:[/b] [code]cName[/code] - The exact case-sensitive name of the Component node to find.
func get_component(cName: String) -> Component:
	for c in components : if c.name == cName : return c
	push_warning("Warning : component",cName,"not found")
	return null
