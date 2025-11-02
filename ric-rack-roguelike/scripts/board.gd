extends Node2D

@export var tileScene: PackedScene
@export var cardScene: PackedScene
@export var board_size:int = 3
@onready var board:= $"."
var boardState:= []
var tileList:= []
signal moveMade
func _ready():
	create_board()
	center_board()


func create_board():
	var tile_size = 60
	#boardState = [[cardScene, cardScene, cardScene],[cardScene, cardScene, cardScene],[cardScene,cardScene,cardScene]]
	boardState = [[0,0,0],[0,0,0],[0,0,0]]
	for y in range(board_size):
		for x in range(board_size):
			var tile = tileScene.instantiate()
			board.add_child(tile)
			tile.position = Vector2((x- 1)* tile_size, (y-1)*tile_size)
			tile.coords = Vector2(x, y)
			tile.index = (y*board_size)+x+1
			tileList.append(tile)
			#tile.connect("_on_tile_clicked", print_index)
			tile.connect("_on_tile_clicked", updateBoardState)


func center_board():
	var viewport_size = get_viewport_rect().size
	print(viewport_size)
	var board_pxl_size = Vector2(board_size, board_size)
	
	board.position = viewport_size/2 - board_pxl_size/2

func updateBoardState(coordinates: Vector2):
	boardState[coordinates.x][coordinates.y] = 1
	moveMade.emit(boardState)
	robotMove()

func robotMove():
	var hasNotMoved = true
	while(hasNotMoved):
		var x_coord = randi_range(0, 2)
		var y_coord = randi_range(0, 2)
		if(boardState[x_coord][y_coord] == 0):
			hasNotMoved = false
			boardState[x_coord][y_coord] = -1
			tileList[y_coord*board_size+x_coord].robo_tile()
			moveMade.emit(boardState)



func print_index(index):
	print(index)
