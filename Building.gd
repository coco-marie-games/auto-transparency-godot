extends StaticBody2D

onready var sprite = $Sprite

func _on_Area2D_body_entered(body):
	sprite.modulate.a = 0.3

func _on_Area2D_body_exited(body):
	sprite.modulate.a = 1
