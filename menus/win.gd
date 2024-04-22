extends Node2D

@onready var game = preload("res://game/game.tscn");
@onready var PlayerOneInstance = Players.playerOneCharacter;
@onready var PlayerTwoInstance = Players.playerTwoCharacter;

var playerOne;
var playerTwo;

# Called when the node enters the scene tree for the first time.
func _ready():
	playerOne = PlayerOneInstance.instantiate();
	playerTwo = PlayerTwoInstance.instantiate();
	add_child(playerOne);
	add_child(playerTwo);
	playerTwo.scale.x *= -1;
	playerOne.global_position = Vector2(600,600);
	playerTwo.global_position = Vector2(1300,600);
	$Background.texture = GameInfo.stage;
	game.winner.connect(setDads);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setDads(dad):
	if dad == 1:
		playerOne.anims.play("victory");
		playerTwo.anims.play("loss");
	else:
		playerOne.anims.play("loss");
		playerTwo.anims.play("victory");
