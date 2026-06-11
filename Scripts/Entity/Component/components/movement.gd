class_name MovementComponent
extends Component

var coyote_time : float = 0.2
var coyote_timer : float = 0.0
var jump_buffer_time : float = 0.1
var jump_buffer_timer : float = 0.0

var player : Player
const pS = EntityStats.Stats
func init(e:Entity) -> void:
	player = e
	_status = true

func process(delta)->void:
	if not _status : return
	_handle_coyote_time(delta)
	_handle_jump_buffer(delta)
	
	dash(delta)
	if player.is_dashing : return 
	
	move(delta)
	jump(delta)

func _handle_coyote_time(delta)-> void :
	if player.is_on_floor():  coyote_timer = coyote_time
	else : coyote_timer -= delta

func _handle_jump_buffer(delta) -> void:
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = jump_buffer_time
	
	jump_buffer_timer -= delta


## Makes the Player Move 
func move(_delta) -> void:
	player.velocity.x = player.move_direction * player.get_stat(pS.speed)
	#print("Movement direction :", player.move_direction, " velocity in x :",player.velocity.x)


func jump(_delta) -> void:
	if jump_buffer_timer > 0 and coyote_timer > 0:
		player.velocity.y = -player.get_stat(pS.jump_strength)
		
		jump_buffer_timer = 0
		coyote_timer = 0
	
	#if not ( player.is_jumping and player.is_on_floor() ): return
	#
	#player.velocity.y = player.get_stat(pS.jump_strength) * -1 
	##print("Jumped, velocity in y :",player.velocity.y)


func dash(_delta) -> void:
	if not Input.is_action_just_pressed("dash") : return
	
	player.is_dashing = true
	player.velocity.x = player.face_direction * 666
	await get_tree().create_timer(0.2).timeout
	player.is_dashing = false
