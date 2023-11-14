class_name iWeapon
extends Sprite2D
@export_group("Instances")
##Put here scene with correct bullet
@export var bullet : PackedScene
@export var rate_timer : Timer
@export_group("")
@export var rotation_speed : float = 2.0
@export var attack_rate : float = .5

var _can_attack : bool = true
var _position : Vector2 = Vector2()

func _ready() -> void:
	rate_timer.wait_time = attack_rate
	print("Heloo KatyaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
	print("Test of merge")

func _process(delta: float) -> void:
	_rotate_to_target(_position, delta)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed == true and _can_attack:
		_position = event.position
		var _bullet_instance = bullet.instantiate()
		_bullet_instance.position = global_position
		_bullet_instance.global_rotation = global_rotation
		add_child(_bullet_instance)
		_can_attack = false
		rate_timer.start()

func _rotate_to_target(target, delta) -> void:
	var _direction = (target - global_position)
	var _angleTo = transform.x.angle_to(_direction)
	rotate(sign(_angleTo) * min(delta * rotation_speed, abs(_angleTo)))

func _on_timer_timeout() -> void:
	_can_attack = true
