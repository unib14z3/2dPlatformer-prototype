class_name EntityStats
extends Resource

enum Stats {
	level,
	xp,
	health,
	attack,
	deffence,
	jump_strength,
	speed
}
var level : int = 1 
var Max_XP : float = 100
var xp : float = 0

# Vitality 
@export var Base_Max_HEALTH : float = 100.0 
@export var Base_DEFFENCE : float = 0.0
var _health : float = 100.0 :
	set(new_health):
		_health = max(0,Base_Max_HEALTH)
	get:
		return _health

var deffence : float = 0.0


# Movement
@export var Base_SPEED : float = 200.0
@export var Base_JUMP_STRENGTH : float = 400.0
var speed : float :
	set(val):
		speed = Base_SPEED

var jump_strength : float:
	set(val):
		jump_strength = Base_JUMP_STRENGTH

# Attack
@export var Base_ATTACK : float = 0.0
@export var Base_CRIT_RATE : float = 0.0
var attack : float = 0.0
var crit_rate : float = 0.0

func calculate_damage(val:float)-> float:
	if val - deffence > 0 : return abs(val - deffence)
	return 0

func apply_damage(dmg : float) -> void :
	_health = _health - dmg
