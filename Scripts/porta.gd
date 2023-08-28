extends StaticBody3D

@onready var trinco: Node3D = $Trinco

var fechado: bool = true
var tween: Tween

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func interaction():
	if fechado:
		tween = create_tween()
		tween.tween_property(trinco, "rotation_degrees:y", -45, 0.3)
		tween.tween_property(self, "rotation_degrees:z", -90, 0.8).set_ease(Tween.EASE_OUT)
		tween.parallel().tween_property(trinco, "rotation_degrees:y", 0, 0.2)
		fechado = false
	else:
		tween = create_tween()
		tween.tween_property(self, "rotation_degrees:z", 0, 1.0).set_ease(Tween.EASE_OUT)
		fechado = true
