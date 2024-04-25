extends Node2D

signal turnChange;

@onready var PlayerOneInstance = Players.playerOneCharacter;
@onready var PlayerTwoInstance = Players.playerTwoCharacter;

@onready var p1hp = $PlayerOneGui/Health;
@onready var p2hp = $PlayerTwoGui/Health;
@onready var p1en = $PlayerOneGui/Energy;
@onready var p2en = $PlayerTwoGui/Energy;

@onready var medTexture = $PlayerOneGui/Meds/TextureRect;

var turn = 1;
var playerOne;
var playerTwo;
var p1Strength = 0;
var p2Strength = 0;

var turnBuffer = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Background.set_texture(GameInfo.stage);
	$Buttons/Main/Fight.grab_focus();
	MenuMusic.stop();
	
	playerOne = PlayerOneInstance.instantiate();
	playerTwo = PlayerTwoInstance.instantiate();
	add_child(playerOne);
	add_child(playerTwo);
	playerTwo.scale.x *= -1;
	playerOne.global_position = Vector2(600,600);
	playerTwo.global_position = Vector2(1300,600);
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if p2hp.value <= 0: 
		GameInfo.winner = 1;
		get_tree().change_scene_to_file("res://menus/win.tscn");
	if p1hp.value <= 0:
		GameInfo.winner = 2;
		get_tree().change_scene_to_file("res://menus/win.tscn");


func _on_fight_pressed():
	$Buttons/Main.hide();
	$Buttons/Fight.show();
	$Buttons/Fight/Punch.grab_focus();

func _on_action_pressed():
	$Buttons/Main.hide();
	$Buttons/Action.show();
	$Buttons/Action/Eat.grab_focus();
	
func _input(event):
	if event.is_action_pressed("ui_cancel") and not event.is_echo():
		if $Buttons/Fight.visible == true or $Buttons/Action.visible == true:
			$Buttons/Fight.hide();
			$Buttons/Action.hide();
			$Buttons/Main.show();
			$Buttons/Main/Fight.grab_focus();
		#else if $Buttons/Main.visible == true:
			#$Pause.show();
			



func _on_punch_pressed():
	if turnBuffer == true: return;
	turnBuffer = true;
	if turn % 2 != 0:
		playerOne.anims.play("punch");
		
		await(get_tree().create_timer(1).timeout);
		playerOne.generic.play();
		playerTwo.anims.play("hit");
		await(playerOne.anims.animation_finished);
		
		p2hp.value -= 10 + p1Strength;
		p1en.value += 10;
	else:
		playerTwo.anims.play("punch");
		
		await(get_tree().create_timer(1).timeout);
		playerTwo.generic.play();
		playerOne.anims.play("hit");
		await(playerTwo.anims.animation_finished);
		
		p1hp.value -= 10 + p2Strength;
		p2en.value += 10;
	
	turn += 1;
	turnChange.emit();
	turnBuffer = false;


func _on_kick_pressed():
	if turnBuffer == true: return;
	turnBuffer = true;
	if turn % 2 != 0:
		playerOne.anims.play("kick");
		
		await(get_tree().create_timer(1).timeout);
		playerOne.generic.play();
		playerTwo.anims.play("hit");
		await(playerOne.anims.animation_finished);
		
		p2hp.value -= 10 + p1Strength;
		p1en.value += 10;
	else:
		playerTwo.anims.play("kick");
		
		await(get_tree().create_timer(1).timeout);
		playerTwo.generic.play();
		playerOne.anims.play("hit");
		await(playerTwo.anims.animation_finished);
		
		p1hp.value -= 10 + p2Strength;
		p2en.value += 10;
	
	turn += 1;
	turnChange.emit();
	turnBuffer = false;


func _on_strong_pressed():
	if turnBuffer == true: return;
	turnBuffer = true;
	if turn % 2 != 0:
		if p1en.value < 30: turnBuffer = false; return;
		p1en.value -= 30;
		
		playerOne.anims.play("strong");
		playerOne.strong.play();
		await(get_tree().create_timer(1).timeout);
		
		playerTwo.anims.play("hit");
		await(playerOne.anims.animation_finished);
		
		p2hp.value -= 25 + p1Strength;
	else:
		if p2en.value < 30: turnBuffer = false; return;
		p2en.value -= 30;
		
		playerTwo.anims.play("strong");
		playerTwo.strong.play();
		await(get_tree().create_timer(1).timeout);
		
		playerOne.anims.play("hit");
		await(playerTwo.anims.animation_finished);
		
		p1hp.value -= 25 + p2Strength;
	
	turn += 1;
	turnChange.emit();
	turnBuffer = false;


func _on_special_pressed():
	if turnBuffer == true: return;
	turnBuffer = true;
	if turn % 2 != 0:
		if p1en.value < 65: turnBuffer = false; return;
		p1en.value -= 65;
		
		playerOne.anims.play("special");
		playerOne.special.play();
		await(get_tree().create_timer(1).timeout);
		
		playerTwo.anims.play("hit");
		await(playerOne.anims.animation_finished);
		
		p2hp.value -= 40 + p1Strength;
	else:
		if p2en.value < 65: turnBuffer = false; return;
		p2en.value -= 65;
		
		playerTwo.anims.play("special");
		playerTwo.special.play();
		await(get_tree().create_timer(1).timeout);
		
		playerOne.anims.play("hit");
		await(playerTwo.anims.animation_finished);
		
		p1hp.value -= 40 + p2Strength;
	
	turn += 1;
	turnChange.emit();
	turnBuffer = false;


func _on_eat_pressed():
	if turnBuffer == true: return;
	turnBuffer = true;
	if turn % 2 != 0:
		if GameInfo.playerOneFood == 0: turnBuffer = false; return;
		updateFood(1);
		playerOne.anims.play("eat");
		playerOne.eat.play();
		await(playerOne.anims.animation_finished);
		p1en.value += 45;
		p1hp.value += 20;
	else:
		if GameInfo.playerTwoFood == 0: turnBuffer = false; return;
		updateFood(2);
		playerTwo.anims.play("eat");
		playerTwo.eat.play();
		await(playerTwo.anims.animation_finished);
		p2en.value += 45;
		p2hp.value += 20;
	
	turn += 1;
	turnChange.emit();
	turnBuffer = false;


func _on_drink_pressed():
	if turnBuffer == true: return;
	turnBuffer = true;
	if turn % 2 != 0:
		if GameInfo.playerOneDrinks == 0: turnBuffer = false; return;
		playerOne.anims.play("drink");
		playerOne.drink.play();
		updateDrinks(1);
		await(playerOne.anims.animation_finished);
		p1en.value += 35;
	else:
		if GameInfo.playerTwoDrinks == 0: turnBuffer = false; return;
		playerTwo.anims.play("drink");
		playerTwo.drink.play();
		updateDrinks(2);
		await(playerTwo.anims.animation_finished);
		p2en.value += 35;
	
	turn += 1;
	turnChange.emit();
	turnBuffer = false;


func _on_train_pressed():
	if turnBuffer == true: return;
	turnBuffer = true;
	if turn % 2 != 0:
		updateStrength(1);
		playerOne.anims.play("train");
		playerOne.train.play();
		await(playerOne.anims.animation_finished);
		p1Strength += 5;
	else:
		updateStrength(2);
		playerTwo.anims.play("train");
		playerTwo.train.play();
		await(playerTwo.anims.animation_finished);
		p2Strength += 5;
	
	turn += 1;
	turnChange.emit();
	turnBuffer = false;


func _on_medicine_pressed():
	if turnBuffer == true: return;
	turnBuffer = true;
	if turn % 2 != 0:
		if GameInfo.playerOneMeds == 0:turnBuffer = false; return;
		updateMeds(1);
		playerOne.anims.play("medicine");
		playerOne.medicine.play();
		await(playerOne.anims.animation_finished);
		p1hp.value += 35;
	else:
		if GameInfo.playerTwoMeds == 0: turnBuffer = false; return;
		updateMeds(2);
		playerTwo.anims.play("medicine");
		playerTwo.medicine.play();
		await(playerTwo.anims.animation_finished);
		p2hp.value += 35;
	
	turn += 1;
	turnChange.emit();
	turnBuffer = false;


func updateFood(player):
	if player == 1:
		$PlayerOneGui/Food.remove_child($PlayerOneGui/Food.get_child(0));
		GameInfo.playerOneFood -= 1;
	else:
		$PlayerTwoGui/Food.remove_child($PlayerTwoGui/Food.get_child(0));
		GameInfo.playerTwoFood -= 1;
	
func updateDrinks(player):
	if player == 1:
		$PlayerOneGui/Drinks.remove_child($PlayerOneGui/Drinks.get_child(0));
		GameInfo.playerOneDrinks -= 1;
	else:
		$PlayerTwoGui/Drinks.remove_child($PlayerTwoGui/Drinks.get_child(0));
		GameInfo.playerTwoDrinks -= 1;
	
func updateMeds(player):
	if player == 1:
		$PlayerOneGui/Meds.remove_child($PlayerOneGui/Meds.get_child(0));
		GameInfo.playerOneMeds -= 1;
	else:
		$PlayerTwoGui/Meds.remove_child($PlayerTwoGui/Meds.get_child(0));
		GameInfo.playerTwoMeds -= 1;
	
func updateStrength(player):
	var icon = TextureRect.new();
	var image = load("res://assets/game/weight.png");
	icon.texture = image;
	if player == 1:
		$PlayerOneGui/Strength.add_child(icon);
	else:
		$PlayerTwoGui/Strength.add_child(icon);
	

func _on_turn_change():
	if turn % 2 != 0:
		$TurnCounter.texture = load("res://assets/game/playeroneturn.png");
		$TurnCounter.global_position = Vector2(17,992);
	else:
		$TurnCounter.texture = load("res://assets/game/playertwoturn.png");
		$TurnCounter.global_position = Vector2(1282,992);
	$Buttons/Fight.hide();
	$Buttons/Action.hide();
	$Buttons/Main.show();
	$Buttons/Main/Fight.grab_focus();
	
