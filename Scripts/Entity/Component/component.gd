@abstract class_name Component
extends Node

@export var _status := true

@abstract func init(_e:Entity) -> void 
@abstract func process(_delta) -> void

func disable() -> void :
	_status = false

func enable() -> void :
	_status = true

func toggle__status():
	_status = !_status
