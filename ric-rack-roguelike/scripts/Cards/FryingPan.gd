class_name FryingPan extends Card

func _init(team):
	name = "FryingPan"
	self.team = team
	types = [Type.MELEE]
	points = 2
	cost = 4

func ability(boardState: Array[Card]):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	for i in range(len(boardState)):
		if isInCorner(boardState[0]):
			output[i].append(Vector2(Card.Modifier.MULT, 1.8))
	return output
