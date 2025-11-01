extends Node2D

@export var tileScene: PackedScene
@export var board_size:int = 3
@onready var board:= $"."
func _ready():
	create_board()
	center_board()
	
func create_board():
	var tile_size = 60
	for y in range(board_size):
		for x in range(board_size):
			var tile = tileScene.instantiate()
			board.add_child(tile)
			tile.position = Vector2((x- 1)* tile_size, (y-1)*tile_size)
			tile.index = (y*board_size)+x+1
			tile.connect("_on_tile_clicked", print_index)

func center_board():
	var viewport_size = get_viewport_rect().size
	print(viewport_size)
	var board_pxl_size = Vector2(board_size, board_size)
	
	board.position = viewport_size/2 - board_pxl_size/2

func print_index(index):
	print(index)
	
