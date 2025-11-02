extends Area2D

@onready var tile_sprite: Sprite2D = $Sprite2D
@onready var tile:= $"."
var index:int = -1
var coords:Vector2 = Vector2(-1,-1)
var lockTiles:bool = true
var cardName: String= ""

signal _on_tile_clicked
signal _robot_move
#preloading
const iconPath = "res://assets/icons/"
const X_texture = preload("res://assets/TilePlaceholderX.png") 
const O_texture = preload("res://assets/TilePlaceholderO.png")
#func _on_mouse_entered() -> void:
	#_on_tile_clicked.emit(index)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if(event is InputEventMouseButton):
		if event.pressed and !lockTiles:
			print("mark")
			if(cardName!=""):
				mark_tile()
			print("emit")
		_on_tile_clicked.emit(coords)

func mark_tile():
	var newTexture = ImageTexture.create_from_image(Image.load_from_file(iconPath + cardName + ".svg"))
	tile_sprite.texture = newTexture
func robo_tile():
	tile_sprite.texture = O_texture
	_robot_move.emit()
