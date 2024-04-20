extends Node2D

@onready var firstButton = $PlayerOneCharacters/CoolDad;
# Called when the node enters the scene tree for the first time.
func _ready():
	firstButton.grab_focus();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://game/game.tscn");


func _on_cool_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/cool.tscn");


func _on_buff_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/buff.tscn");


func _on_drunk_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/drunk.tscn");


func _on_asian_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/asian.tscn");


func _on_golf_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/golf.tscn");


func _on_fish_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/fish.tscn");


func _on_gamer_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/gamer.tscn");


func _on_milk_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/milk.tscn");


func _on_football_dad_pressed():
	Players.playerOneCharacter = preload("res://game/dads/football.tscn");


func _on_cool_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/cool.tscn");


func _on_buff_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/buff.tscn");


func _on_drunk_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/drunk.tscn");


func _on_asian_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/asian.tscn");


func _on_golf_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/golf.tscn");


func _on_fish_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/fish.tscn");


func _on_gamer_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/gamer.tscn");


func _on_milk_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/milk.tscn");


func _on_football_dad_two_pressed():
	Players.playerTwoCharacter = preload("res://game/dads/football.tscn");

