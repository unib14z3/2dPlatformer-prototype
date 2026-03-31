class_name EntityStats
extends Resource

var Level : int = 1 
var Max_XP : float = 100
var Xp : float = 0

# Vitality 
@export var Base_Max_HEALTH : float = 100.0 
@export var Base_DEFFENCE : float = 0.0
var _health : float = 100.0 :
	set(new_health):
		_health = max(0,Base_Max_HEALTH
		)
	get:
		return _health

var deffence : float = 0.0


# Movement
@export var Base_SPEED : float = 200.0
@export var Base_JUMP_STRENGTH : float = 400.0
var speed : float = 0.0 
var jump_strength : float = 0.0

# Attack
@export var Base_ATTACK : float = 0.0
@export var Base_CRIT_RATE : float = 0.0
var attack : float = 0.0
var crit_rate : float = 0.0

# Prana
@export var Base_MANA : float = 0.0
@export var Base_AURA : float = 0.0

func calculate_damage(val:float)-> float:
	if val - deffence > 0 : return abs(val - deffence)
	return 0

func apply_damage(dmg : float) -> void :
	_health = _health - dmg

 
