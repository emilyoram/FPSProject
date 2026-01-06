extends Label

var file_path = "user://score.save"

func _ready():
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		text = "High Score: " + str(file.get_var())
