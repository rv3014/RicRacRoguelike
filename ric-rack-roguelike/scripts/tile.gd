extends Area2D

@onready var tile_sprite: Sprite2D = $Sprite2D
@onready var tile:= $"."
var index:int = -1
var coords:Vector2 = Vector2(-1,-1)
signal _on_tile_clicked

#preloading
const X_texture = preload("res://assets/TilePlaceholderX.png") 

#func _on_mouse_entered() -> void:
	#_on_tile_clicked.emit(index)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if(event is InputEventMouseButton):
		if event.pressed:
			mark_tile()
			#_on_tile_clicked.emit(index)
			_on_tile_clicked.emit(coords)

func mark_tile():
	tile_sprite.texture = X_texture
