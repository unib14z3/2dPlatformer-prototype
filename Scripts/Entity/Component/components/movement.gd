class_name MovementComponent
extends Component

var player : Player
@export var speed : float
@export var jump_strength : float

func init(e:Entity) -> void:
	player = e
	status = true
	speed = player.stats.speed
	jump_strength = player.stats.jump_strength

func process(delta)->void:
	if status:
		if player.velocity.x != 0 and player.velocity.y==0 : player.animator.play("run")
		else : player.animator.play("idle")
		
		if player.velocity.y > 0 : player.animator.play("rise")
		if player.velocity.y < 0 : player.animator.play("fall")
		
		move(delta)
		jump(delta)
	else :
		print("Movement Component is disabled")

func move(_delta) -> int:
	var error_code := 0
	var dir := Input.get_axis("move_left","move_right")
	
	if dir > 0 :
		player.animator.flip_h = false
		player.hitbox.scale.x = 1
	elif dir < 0 : 
		player.animator.flip_h = true
		player.hitbox.scale.x = -1
		
	player.velocity.x = dir * player.get_speed() 
	print("Movement direction :", dir, " velocity in x :",player.velocity.x)
	
	return error_code

func jump(_delta)->int:
	var error_code := 0
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = player.get_jump_strength() * -1 
		print("Jumped, velocity in y :",player.velocity.y)
	
	return error_code
