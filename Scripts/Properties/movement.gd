class_name MovementComponent
extends Node

var player : Player
@export_range(100,500) var base_speed : float = 200.0
@export_range(200,600) var jump_strength : float = 400
var status : bool

func init(p: CharacterBody2D) -> void:
	player = p
	status = true

func process(delta)->void:
	if status:
		
		if player.velocity.x != 0 and player.velocity.y==0 : player.animator.play("run")
		else : player.animator.play("idle")
		
		if player.velocity.y > 0 : player.animator.play("rise")
		if player.velocity.y < 0 : player.animator.play("fall")
		
		move(delta)
		jump(delta)

func move(_delta) -> int:
	var error_code := 0
	var dir := Input.get_axis("move_left","move_right")
	
	if dir > 0 :
		player.animator.flip_h = false
		player.hitbox.scale.x = 1
	elif dir < 0 : 
		player.animator.flip_h = true
		player.hitbox.scale.x = -1
		
	player.velocity.x = dir * base_speed 
	# print("Movement direction :", dir, " velocity in x :",player.velocity.x)
	
	return error_code

func jump(_delta)->int:
	var error_code := 0
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = jump_strength * -1 
		#print("Jumped, velocity in y :",player.velocity.y)
	
	return error_code

func disable():
	status = false

func enable():
	status = true

func toggle_status():
	status = !status
