class_name Ballista extends Card

func _init(team):
	name = "Ballista"
	self.team = team
	types = [Type.RANGED]
	points = 1
	cost = 4

func ability(boardState: Array[Card]):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	for i in range(len(boardState)):
		if isMyEnemy(boardState[i]):
			continue
		if isInColumn(boardState[0], x) and isRanged(boardState[0]):
			output[i].append(Vector2(Card.Modifier.MULT, 2))
		if isInRow(boardState[0], y) and isMelee(boardState[0]):
			output[i].append(Vector2(Card.Modifier.MULT, 0.5))
	return output
