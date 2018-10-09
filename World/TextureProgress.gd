extends TextureProgress

func _on_Player_healthChanged(maxHealth, previousHealth, newHealth):

	$Tween.interpolate_property(self,
			'value', previousHealth, newHealth,
			0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
