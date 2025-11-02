class_name Tower extends Card

func _init(team):
	name = "Tower"
	self.team = team
	types = [Type.RANGED]
	points = 2
	cost = 7

func ability(boardState: Array[Card]):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	if !isInCorner(self):
		return output
	for i in range(len(boardState)):
		if isMyEnemy(boardState[i]):
			output[i].append(Vector2(Card.Modifier.ADD, 2))
	return output
