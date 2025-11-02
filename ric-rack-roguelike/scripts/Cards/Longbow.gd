class_name Longbow extends Card

func _init(team):
	name = "Longbow"
	self.team = team
	types = [Type.RANGED]
	points = 2
	cost = 4

func ability(boardState: Array[Card]):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	for i in range(len(boardState)):
		if isMyEnemy(boardState[i]):
			continue
		if !isOrthogonal(boardState[i]):
			output[i].append(Vector2(Card.Modifier.ADD, 2))
	return output
