extends Node

@onready var board:= $Board
@onready var hand:= $Hand
var gameWon: bool = false
var totalMoves: int = 0

var currentCard : Card

var points : int = 0
var point_goal : int = 10

signal tileSelected

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
	
func _process(delta: float):
	$Label.text = "Points: " + str(points) + '/' + str(point_goal)

func selectCard(card):
	currentCard = card
	board.cardSelected = currentCard
	print(currentCard.name)

func check_win(boardState):
	
	totalMoves+=1
	if(totalMoves % 2 == 1):
		print("emit card")
		tileSelected.emit(currentCard)
		currentCard = null

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
		compute_instructions(abilities(boardState))
		print(points)
		return gameWon
		
func abilities(boardState): #Boardstate is a list of 9 Cards in the order of index
	var instructions = []
	instructions.resize(len(boardState))
	instructions.fill([])
	for card in boardState:
		var output = card.ability(boardState)
		if card.getTeam() == Card.Team.PLAYER:
			for i in range(len(instructions)):
				instructions[i].append_array(output[i])
		elif card.getTeam() == Card.Team.ENEMY:
			for i in range(len(instructions)):
				for j in output[i]:
					if output[i][j][0] == Card.Modifier.ADD:
						output[i][j][1] *= -1
					if output[i][j][0] == Card.Modifier.MULT:
						output[i][j][1] = 1 / output[i][j][1]
				instructions[i].append_array(output[i])

	return instructions

			
			
		
func compute_instructions(instructions):
	var cps : Array[int] = []
	var sum : int = 0
	for card in instructions:
		var cp = card.points
		for instruction in card:
			if instruction[0] == Card.Modifier.ADD:
				cp += instruction[1]
			elif instruction[0] == Card.Modifier.MULT:
				cp *= instruction[1]
		cps.append(floor(cp))
	for pt in cps:
		sum += pt
	return sum
