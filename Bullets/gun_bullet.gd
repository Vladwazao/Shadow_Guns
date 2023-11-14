extends Area2D

@export var speed : int = 250

var velocity : Vector2 = Vector2(1, 0)

var _is_look_once : bool = true

func _process(delta: float) -> void:
	if _is_look_once:
		_is_look_once = false
	global_position += velocity.rotated(rotation) * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
