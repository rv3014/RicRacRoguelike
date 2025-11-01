extends Node

@onready var board:= $Board
const win_cons = [
	[
		
	[1, 1, 1],
	[0, 0, 0],
	[0, 0, 0]],
	
	[
	[0, 0, 0],
	[1, 1, 1],
	[0, 0, 0]],
	
	[[0, 0, 0],
	[0, 0, 0],
	[1, 1, 1]],
	
	[[1, 0, 0],
	[1, 0, 0],
	[1, 0, 0]],
	
	[[0, 1, 0],
	[0, 1, 0],
	[0, 1, 0]],
	
	[[0, 0, 1],
	[0, 0, 1],
	[0, 0, 1]],
	
	[[0, 0, 1],
	[0, 1, 0],
	[1, 0, 0]],
	
	[[1, 0, 0],
	[0, 1, 0],
	[0, 0, 1]]
	]

func _ready():
	board.connect("moveMade", check_win)

func check_win(boardState):
	
	print("works")
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
		if(row_sum == -3 or col_sum == -3 or diagonal1_sum == -3 or diagonal2_sum == -3):
			print("Enemy Wins")
	return
