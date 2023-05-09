extends Node

const SAVE_DIR_PATH = "user://save_data"
const SAVE_FILE_NAME = "/save"
const SAVE_FILE_EXT = ".json"

func _ready():
	init_save_dir()

func init_save_dir():
	if !DirAccess.dir_exists_absolute(SAVE_DIR_PATH):
		DirAccess.make_dir_absolute(SAVE_DIR_PATH)
	

func save_file(index, content):
	var path = SAVE_DIR_PATH+ SAVE_FILE_NAME + str(index) + SAVE_FILE_EXT
	write_json(path, content)

func load_file(index):
	var path = SAVE_DIR_PATH+ SAVE_FILE_NAME + str(index) + SAVE_FILE_EXT
	var content = read_json(path)
	return content

func write_json(path, content):
	var file = FileAccess.open(path, FileAccess.WRITE)
	var json_string = JSON.stringify(content)
	file.store_string(json_string)

func read_json(path):
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var json_string = file.get_as_text()
		var data = JSON.parse_string(json_string)
		return data
	else:
		printerr("访问存档路径出错。")
		return ""

func get_save_file_list():
	var dir = DirAccess.open(SAVE_DIR_PATH)
	var list = []
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				var path = SAVE_DIR_PATH + "/" + file_name
				var data = read_json(path)
				if data:
					list.append(data)
			file_name = dir.get_next()
		return list
	else:
		printerr("访问存档路径出错。")
		return ""
