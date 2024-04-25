extends Node2D

@onready var firstButton = $Stages/Office;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Background.texture = GameInfo.stage;
	firstButton.grab_focus();
	$PlayerOneSelection.texture = Players.p1thumbnail;
	$PlayerTwoSelection.texture = Players.p2thumbnail;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://game/game.tscn");
	
	
func _input(event):
	if event.is_action_pressed("ui_cancel") and not event.is_echo():
		get_tree().change_scene_to_file("res://menus/character_select.tscn");


func _on_office_pressed():
	GameInfo.stage = load("res://assets/stages/office-640x386.jpg");
	$Background.texture = GameInfo.stage;


func _on_lot_pressed():
	GameInfo.stage = load("res://assets/stages/lot.webp");
	$Background.texture = GameInfo.stage;


func _on_stadium_pressed():
	GameInfo.stage = load("res://assets/stages/stadium.jpg");
	$Background.texture = GameInfo.stage;


func _on_train_pressed():
	GameInfo.stage = load("res://assets/stages/train.jpg");
	$Background.texture = GameInfo.stage;


func _on_warehouse_pressed():
	GameInfo.stage = load("res://assets/stages/warehouse.webp");
	$Background.texture = GameInfo.stage;
