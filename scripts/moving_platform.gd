extends StaticBody2D


enum Type { SPRING, AUTOMN, WINTER, SUMMER }

@onready var sprite = $Sprite2D

@export var type: Type = Type.SPRING

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setSpriteRange()

func setSpriteRange():
	match type:
		Type.SPRING:
			sprite.region_rect = Rect2(16, 0, 32, 9)
		Type.AUTOMN:
			sprite.region_rect = Rect2(16, 32, 32, 9)
		Type.WINTER:
			sprite.region_rect = Rect2(16, 48, 32, 9)
		_:
			pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
