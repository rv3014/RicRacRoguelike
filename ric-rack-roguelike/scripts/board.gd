extends Node2D

@export var tileScene: PackedScene
@export var board_size:int = 3
@onready var board:= $"."
@onready var hand: Node2D = $"../Hand"
const cardScene = preload("res://scenes/card.tscn")

var boardState:= []


var cardState:= []
var tileList:= []
var gameResult: bool = false
var totalMoves: int = 0
var cardSelected: Card = null
signal moveMade


func _ready():
	create_board()
	center_board()
	
func create_board():
	var tile_size = 64 * 5 / 3
	boardState = [[0,0,0],[0,0,0],[0,0,0]]
	cardState = [[0,0,0],[0,0,0],[0,0,0]]
	hand.connect("selectedCard", unlock)

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
	
	board.position.x = (viewport_size/2).x - (board_pxl_size/2).x
	board.position.y += (4*viewport_size/10).y - (board_pxl_size/2).y

func updateBoardState(coordinates: Vector2):
	if(totalMoves<10 and cardSelected != null):
		totalMoves+=1
		print("moved")
	elif(cardSelected != null):
		gameResult = true
	if(cardSelected  != null):
		for tile in tileList:
			tile.lockTiles = false
	if(!gameResult and cardSelected != null):
		if(boardState[coordinates.x][coordinates.y] == 0):
			boardState[coordinates.x][coordinates.y] = 1
			moveMade.emit(boardState)
			robotMove()
	else:
		for tile in tileList:
			tile.lockTiles = true

func robotMove():
	var hasNotMoved = true
	if(totalMoves<9):
		totalMoves+=1
	else:
		gameResult = true
	
	while(hasNotMoved and !gameResult):
		var x_coord = randi_range(0, 2)
		var y_coord = randi_range(0, 2)
		if(boardState[x_coord][y_coord] == 0):
			hasNotMoved = false
			boardState[x_coord][y_coord] = -1
			tileList[y_coord*board_size+x_coord].robo_tile()
			tileList[y_coord*board_size+x_coord].lockTiles = true
			moveMade.emit(boardState)
	if(gameResult):
		for tile in tileList:
			tile.lockTiles = true

func unlock(card):
	for tile in tileList:
		tile.lockTiles = false

func result_handler():
	gameResult = true

func print_index(index):
	print(index)
	
