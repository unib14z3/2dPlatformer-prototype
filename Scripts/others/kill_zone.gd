extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is Entity:
		#print("body is entity killing body")
		body.die()
	else:
		#print("body is not of type entity")
		pass
