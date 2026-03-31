class_name  GravityComponent
extends Component

var player : Entity
@export var accleration : float = 980.0        

func init(e:Entity) -> void:
	player = e
	status = true

func process(_delta):
	if not player.is_on_floor():
		player.velocity.y += accleration * _delta
		#print("gravity added ",accleration)
		#print("current velocity in y ", player.velocity.y)
	else:
		player.velocity.y = 0
		#print("gravity set to 0")
