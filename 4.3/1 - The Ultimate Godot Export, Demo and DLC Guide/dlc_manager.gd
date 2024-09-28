extends Node

var dlc_location := "dlc"
var dlc_loads: Dictionary

func _init() -> void:
	var root := ProjectSettings.globalize_path("res://")
	var dlc_files = get_files(root, dlc_location)
	
	for file_path in dlc_files:
		ProjectSettings.load_resource_pack(file_path)
		
	var dlc_files_from_inside = get_files("res://", dlc_location)
	
	for file_path in dlc_files_from_inside:
		var new_path: String = file_path.replace(".remap", "").replace(".import", "")
		dlc_loads[new_path] = load(new_path)
		print(new_path)
	
func get_files(root: String, location: String) -> Array[String]:
	var dir: DirAccess = DirAccess.open(root + location)
	var files: Array[String] = []
	
	if dir:
		dir.list_dir_begin()
		var file := dir.get_next()
		while file != "":
			var file_location := location + "/" + file
			if dir.current_is_dir():
				files += get_files(root, file_location)
			else:
				files.append(file_location)
			file = dir.get_next()
		dir.list_dir_end()
		return files
	return []
