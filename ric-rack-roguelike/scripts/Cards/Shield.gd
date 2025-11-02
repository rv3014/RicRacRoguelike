class_name Shield extends Card

func _init(team):
	name = "Shield"
	self.team = team
	types = [Type.MELEE]
	points = 1
	cost = 6

func ability(boardState: Array[Card]):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	for i in range(len(boardState)):
		if isMyEnemy(boardState[i]):
			continue
		if isMelee(boardState[i]):
			output[i].append(Vector2(Card.Modifier.ADD, 2))
	return output
