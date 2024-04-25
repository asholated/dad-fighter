extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Play.grab_focus();
	MenuMusic.play();
	$OptionsMenu.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://menus/character_select.tscn");


func _on_quit_pressed():
	get_tree().quit();


func _on_options_pressed():
	$OptionsMenu.show();
	$OptionsMenu/Quit.grab_focus();

func _on_options_menu_visibility_changed():
	if $OptionsMenu.visible == false:
		$Play.grab_focus();
