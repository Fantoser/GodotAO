extends AudioStreamPlayer

func _ready():
	pass

func _on_Main_play_song(song):
	if song != "stop" and song.ends_with(".ogg"):
		song = load_ogg(song)
		if song is AudioStream:
			set_stream(song)
			play()
			return
	stop()

func load_ogg(song):
	var path = ProjectSettings.globalize_path("res://")
	if path == "":
		# Exported, will return the folder where the executable is located.
		path = OS.get_executable_path().get_base_dir()
	else:
		# Editor
		path = path.get_base_dir()
	path += "/music/" + song
	var ogg_file = File.new()
	ogg_file.open(path, File.READ)
	var bytes = ogg_file.get_buffer(ogg_file.get_len())
	var stream = AudioStreamOGGVorbis.new()
	stream.data = bytes
	ogg_file.close()
	return stream