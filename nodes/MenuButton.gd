tool
extends Button

#How much bigger than the text should the button be
export var __button_margin_scale : float = 1.2 setget set_bm_scale

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$NinePatchRect.self_modulate.a = 0
	update_layout()
	self.connect("focus_entered", self, "on_focus_entered")
	self.connect("focus_exited", self, "on_focus_exited")
	$AnimationPlayer.connect("animation_finished", self, "on_anim_finished")


func set_bm_scale(p_value) -> void:
	__button_margin_scale = p_value
	update_layout()


func _pressed() -> void:
	$AnimationPlayer.play("pressed")
	$PressedSoundPlayer.play()

func on_anim_finished(p_name : String) -> void:
	if (p_name == "pressed"):
		$AnimationPlayer.play("selected")

func on_focus_entered() -> void:
	$SelectSoundPlayer.play()
	$AnimationPlayer.play("selected")
	pass

func on_focus_exited() -> void:
	$AnimationPlayer.play("deselected")
	pass

func update_layout() -> void:

	#Calculate the size of the button text
	var my_font : Font = self.get_font("font")
	var text_size : Vector2 = my_font.get_string_size(self.text)

	#Make our Button bigger than the text
	self.rect_size = text_size * __button_margin_scale

	#Set our pivot point to be the center of the button
	self.rect_pivot_offset = self.rect_size / 2

	#Get the size of our parent so we can be horizontally centered
	#within it
	var parent = self.get_parent()
	if !parent:
		return
	var parent_size : Vector2
	if "rect_size" in parent:
		parent_size = parent.rect_size
	elif "size" in parent:
		parent_size = parent.size

	rect_position.x = (parent_size.x - rect_size.x) / 2.0
