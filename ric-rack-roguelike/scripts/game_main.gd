extends Node

@onready var board:= $Board
@onready var hand:= $Hand
var gameWon: bool = false
var totalMoves: int = 0

var currentCard : Card

var points : int = 0
var point_goal : int = 10

func pointQuota():
	if points >= point_goal:
		point_goal *= 1.8
		show_shop()

func show_shop():
	get_tree().change_scene_to_file("shop_scene")

func exit_shop():
	get_tree().change_scene_to_file("res://scenes/game_main.tscn")

func _ready():
	board.connect("moveMade", check_win)
	hand.connect("selectedCard", selectCard)

func selectCard(card):
	currentCard = card
	board.cardSelected = currentCard
	print(currentCard.name)

func check_win(boardState):
	totalMoves+=1
	print(totalMoves)
	print(currentCard.name)

	if(totalMoves < 10):
		var row_sum
		var col_sum
		var diagonal1_sum
		var diagonal2_sum
		for i in range(len(boardState)):
			row_sum = boardState[i][0] + boardState[i][1] + boardState[i][2]
			col_sum = boardState[0][i] + boardState[1][i] + boardState[2][i]
			diagonal1_sum = boardState[0][0] + boardState[1][1] + boardState[2][2]
			diagonal2_sum = boardState[0][2] + boardState[1][1] + boardState[2][0]
			
			if(row_sum == 3 or col_sum == 3 or diagonal1_sum == 3 or diagonal2_sum == 3):
				print("Player Wins")
				gameWon = true
				board.gameResult = true
			if(row_sum == -3 or col_sum == -3 or diagonal1_sum == -3 or diagonal2_sum == -3):
				print("Enemy Wins")
				gameWon = false
				board.gameResult = true


	else:
		print("Tie")
		gameWon = true
		board.gameResult = true
		return gameWon
