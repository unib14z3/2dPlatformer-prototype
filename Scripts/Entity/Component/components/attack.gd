class_name AttackComponent
extends Component

var entity : Entity
var hitbox : Area2D
@export var atk : float = 20

func init(e):
	entity = e
	hitbox = entity.hitbox
	atk = entity.stats.attack

func process(_delta):
	slash_attack()

func slash_attack():
	if Input.is_action_just_pressed("attack"):
		var bodies = hitbox.get_overlapping_bodies()
		for body in bodies:
			if (body is Entity) and (body is not Player):
				deal_damage(body,atk)

func deal_damage(e : Entity, _ctx):
	print("dealing damage")
	e.take_damage(_ctx)
