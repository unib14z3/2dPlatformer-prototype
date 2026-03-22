class_name AttackComponent
extends Node

var player : Player
var hitbox : Area2D

func init(p):
	player = p
	hitbox = player.hitbox

func process():
	slash_attack()

func slash_attack():
	if Input.is_action_just_pressed("attack"):
		player.animator.play("attack")
		
		var bodies = hitbox.get_overlapping_bodies()
		for body in bodies:
			if (body is Entity) and (body is not Player):
				deal_damage(body)


func deal_damage(entity : Entity):
	print("dealing damage")
	entity.take_damage()
