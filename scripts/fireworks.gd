extends GPUParticles2D

@export var dir: int = 1

var mat: ParticleProcessMaterial = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mat = process_material
	mat.direction = Vector3(dir, 0, 0)
	mat.changed.emit()
	process_material = mat.duplicate()

