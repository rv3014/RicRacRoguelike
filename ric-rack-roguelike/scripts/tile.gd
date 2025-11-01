extends Area2D

@onready var tile:= $"."
var index:int = 0
signal _on_tile_clicked



#func _on_mouse_entered() -> void:
	#_on_tile_clicked.emit(index)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if(event is InputEventMouseButton):
		if event.pressed:
			_on_tile_clicked.emit(index)

func mark_tile():
	
	return
