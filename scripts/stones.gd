extends AnimatableBody2D


@export var speed = 200
#var moving = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < -300:
		queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
