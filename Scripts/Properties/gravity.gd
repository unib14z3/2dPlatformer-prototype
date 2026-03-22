class_name  GravityComponent
extends Node

var player : CharacterBody2D
var accleration : float = 980         

func init(p: CharacterBody2D)-> void:
	player = p

func process(_delta):
	if not player.is_on_floor():
		player.velocity.y += accleration * _delta
		#print("gravity added ",accleration)
		#print("current velocity in y ", player.velocity.y)
	else:
		player.velocity.y = 0
		#print("gravity set to 0")
