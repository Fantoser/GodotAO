extends ReferenceRect

onready var bg = $bg
onready var character = $character

func _ready():
	pass

func _on_Main_ic_character(resource):
	character.texture = resource