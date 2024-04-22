extends Node2D

@onready var firstButton = $PlayerOneCharacters/CoolDad;
# Called when the node enters the scene tree for the first time.
func _ready():
	firstButton.grab_focus();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://menus/stage_select.tscn");


func _on_cool_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/cool.tscn");
	Players.p1icon = load("res://assets/dads/icons/cool.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/cool dad/thumbnail.png");

func _on_buff_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/buff.tscn");
	Players.p1icon = load("res://assets/dads/icons/buff.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/buff dad/thumbnail.png");

func _on_drunk_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/drunk.tscn");
	Players.p1icon = load("res://assets/dads/icons/drunk.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/drunk dad/thumbnail.png");

func _on_asian_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/asian.tscn");
	Players.p1icon = load("res://assets/dads/icons/asian.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/asian dad/thumbnail.png");

func _on_golf_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/golf.tscn");
	Players.p1icon = load("res://assets/dads/icons/golf.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/golf dad/thumbnail.png");

func _on_fish_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/fish.tscn");
	Players.p1icon = load("res://assets/dads/icons/fish.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/fish dad/thumbnail.png");

func _on_gamer_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/gamer.tscn");
	Players.p1icon = load("res://assets/dads/icons/gamer.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/gamer dad/thumbnail.png");

func _on_milk_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/milk.tscn");
	Players.p1icon = load("res://assets/dads/icons/milk.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/milk dad/thumbnail.png");

func _on_football_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/football.tscn");
	Players.p1icon = load("res://assets/dads/icons/football.png");
	get_node("PlayerOneSelection").texture = load("res://assets/dads/football dad/thumbnail.png");

func _on_cool_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/cool.tscn");
	Players.p2icon = load("res://assets/dads/icons/cool.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/cool dad/thumbnail.png");

func _on_buff_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/buff.tscn");
	Players.p2icon = load("res://assets/dads/icons/buff.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/buff dad/thumbnail.png");

func _on_drunk_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/drunk.tscn");
	Players.p2icon = load("res://assets/dads/icons/drunk.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/drunk dad/thumbnail.png");
	
func _on_asian_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/asian.tscn");
	Players.p2icon = load("res://assets/dads/icons/asian.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/asian dad/thumbnail.png");

func _on_golf_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/golf.tscn");
	Players.p2icon = load("res://assets/dads/icons/golf.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/golf dad/thumbnail.png");

func _on_fish_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/fish.tscn");
	Players.p2icon = load("res://assets/dads/icons/fish.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/fish dad/thumbnail.png");

func _on_gamer_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/gamer.tscn");
	Players.p2icon = load("res://assets/dads/icons/gamer.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/gamer dad/thumbnail.png");

func _on_milk_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/milk.tscn");
	Players.p2icon = load("res://assets/dads/icons/milk.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/milk dad/thumbnail.png");

func _on_football_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/football.tscn");
	Players.p2icon = load("res://assets/dads/icons/football.png");
	get_node("PlayerTwoSelection").texture = load("res://assets/dads/football dad/thumbnail.png");
