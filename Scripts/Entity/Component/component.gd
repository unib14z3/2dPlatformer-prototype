@abstract class_name Component
extends Node

@onready var status := true

@abstract func init(e:Entity) -> void 
@abstract func process(delta) -> void

func disable() -> void :
	status = false

func enable() -> void :
	status = true

func toggle_status():
	status = !status
