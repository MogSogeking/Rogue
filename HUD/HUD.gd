extends CanvasLayer

func _on_Player_healthChanged(maxHealth, previousHealth, newHealth):

	$HBoxContainer/TextureProgress/Tween.interpolate_property($HBoxContainer/TextureProgress,
			'value', previousHealth * 100 / maxHealth, newHealth * 100 / maxHealth,
			0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$HBoxContainer/TextureProgress/Tween.start()
	