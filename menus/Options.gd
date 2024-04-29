extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	hide();


func _on_v_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value));

func _input(event):
	if event.is_action_pressed("ui_cancel") and not event.is_echo():
		hide();
