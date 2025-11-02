class_name Nuke extends Card

func _init(team):
	name = "Nuke"
	self.team = team
	types = [Type.RANGED]
	points = 1
	cost = 8

func ability(boardState: Array[Card]):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	for i in range(len(boardState)):
		if isMe(boardState[0]) and isInMiddle(boardState[0]):
			output[i].append(Vector2(Card.Modifier.MULT, 5))
	return output
