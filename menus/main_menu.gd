extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Play.grab_focus();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://menus/character_select.tscn");
