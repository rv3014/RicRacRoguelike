class_name Bo extends Card

func _init(team):
	name = "Bo"
	self.team = team
	types = [Type.MELEE]
	points = 1
	cost = 3

func ability(boardState: Array[Card]):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	for i in range(len(boardState)):
		if isMe(boardState[0]) and !isInWinLine(boardState[0]):
			output[i].append(Vector2(Card.Modifier.ADD, 3))
			return output
	return output
