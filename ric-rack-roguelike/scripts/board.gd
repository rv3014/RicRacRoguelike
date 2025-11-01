extends Node2D

@export var tileScene: PackedScene
@export var board_size:int = 3
@onready var board:= $"."
func _ready():
	create_board()
	center_board()
	
func create_board():
	var tile_size = 100
	for y in range(board_size):
		for x in range(board_size):
			var tile = tileScene.instantiate()
			board.addchild(tile)
			tile.position = Vector2(x* tile_size, y*tile_size)
			tile.index = y*board_size+x
			
func center_board():
	return
