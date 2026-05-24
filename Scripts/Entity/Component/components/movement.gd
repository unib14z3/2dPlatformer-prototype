class_name MovementComponent
extends Component

var player : Player
const pS = EntityStats.Stats
func init(e:Entity) -> void:
	player = e
	_status = true

func process(delta)->void:
	if not _status:
		print("Movement Component is disabled")
		return
	
	move(delta)
	jump(delta)

## Makes the Player Move 
func move(_delta) -> void:
	player.velocity.x = player.move_direction * player.get_stat(pS.speed)
	#print("Movement direction :", player.move_direction, " velocity in x :",player.velocity.x)

func jump(_delta) -> void:
	if not ( player.is_jumping and player.is_on_floor() ):
		return
	
	player.velocity.y = player.get_stat(pS.jump_strength) * -1 
	#print("Jumped, velocity in y :",player.velocity.y)
