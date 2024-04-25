extends AudioStreamPlayer

const weights = {
	"NORMAL":0.9,
	"FUNNY":0.1
};


var songs = {
		"Dirby Day": {
			"link": preload("res://assets/sound/music/Dirby_day(mp3^320).mp3"),
			"rarity": weights.NORMAL
		},
		"Doom": {
			"link": preload("res://assets/sound/music/Doom(mp3^320).mp3"),
			"rarity": weights.NORMAL
		},
		"Skirmish": {
			"link": preload("res://assets/sound/music/Skirmish(mp3^320).mp3"),
			"rarity": weights.NORMAL
		},
		"Hellfire": {
			"link": preload("res://assets/sound/music/Zander Noriega - Dragged Through Hellfire.mp3"),
			"rarity": weights.NORMAL
		},
		"Recon": {
			"link": preload("res://assets/sound/music/Zander Noriega - The Recon Mission.mp3"),
			"rarity": weights.NORMAL
		},
		"Dance": {
			"link": preload("res://assets/sound/music/s6.mp3"),
			"rarity": weights.FUNNY
		}
		
	};
	
var song;


func _ready():
	pickSong();
	


func pickSong():
	song = songs[WeightedChoice.pick(songs, "rarity")]
	set_stream(song.link);
	play();



func _on_finished():
	pickSong();
