tool
extends TextureRect


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$NewGameButton.grab_focus()
	#print(self.name, rect_size)

	var my_children = self.get_children()
	for c in my_children:
		if c.has_method("update_layout"):
			c.update_layout()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
