#extends Node
#
#class_name Mods
#
#var mods=[]
##sample details
##{
##"name":"cool_mod",
##"mod_version":"v6.6.6",
##"required_client_version":0,
##}
#
#func apply_mod(pck:String,details:Dictionary):
#	if details["mod_version"]!="v6.6.6":
#		if details["required_client_version"]==Api.version:
#			var sucess=ProjectSettings.load_resource_pack(pck)
#			if sucess:
#				mods.append(details)
#			else:
#				print("ERROR WITH LOADING MOD (i don't know what happened, maye permissions?)")
#		else:
#			print("ERROR WITH LOADING MOD:")
#			print("MOD_OUTDATED")
#	else:
#		print("ERROR WITH LOADING MOD:")
#		print("the homosexual iluminati satan elite have infected your computer and there is nothing you can do")
#
#func apply_mod_json(path):
#	var file=File.new()
#	var mod=ls(path)
#	if file.open(path+"/main.json",File.READ) == OK:
#		var content=file.get_as_text()
#		var json=JSON.parse(content)
#		if json.error==OK:
#			json=json.result
#			if typeof(json)==TYPE_DICTIONARY:
#				if json["required_client_version"]==Api.version:
#					if !json["mod_version"]=="v6.6.6":
#						mods.append(json["name"])
#						print("LOADED JSON MOD'S MAIN.JSON "+json["name"])
#					else:
#						print("ERROR WITH LOADING JSON MOD:")
#						print("the homosexual iluminati satan elite have infected your computer and there is nothing you can do (don't set the mod version to v6.6.6 at 3 am)")
#						return;
#				else:
#					print("ERROR WITH LOADING JSON MOD:")
#					print("outdated client/mod")
#					return;
#			else:
#				print("ERROR WITH LOADING JSON MOD:")
#				print("unexpected type")
#				return;
#		else:
#			print("ERROR WITH LOADING JSON MOD:")
#			print("skill issue json")
#			return;
#		file.close()
#	else:
#		print("ERROR WITH LOADING JSON MOD:")
#		print("doesn't have a main.json or couldn't open file")
#		return;
#
#func ls(path):
#	var dir = Directory.new()
#	var files=[]
#	var directories=[]
#	if dir.open(path) == OK:
#		dir.list_dir_begin()
#		var file_name = dir.get_next()
#		while file_name != "":
#			if dir.current_is_dir():
#				if !file_name.begins_with("."):
#					directories.add(file_name)
#			else:
#				files.append(file_name)
#			file_name = dir.get_next()
#	else:
#		print("An error occurred when trying to access the path.")
#	return [files,directories]
#
#func _ready() -> void:
#	apply_mod_json("user://mods/supercoolmod")
