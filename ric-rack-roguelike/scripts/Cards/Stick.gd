class_name Stick extends Card

func _init(team):
<<<<<<<< Updated upstream:ric-rack-roguelike/scripts/Cards/Sword.gd
	name = "Sword"
========
	name = "Stick"
	types = [Type.MELEE]
	
>>>>>>>> Stashed changes:ric-rack-roguelike/scripts/Cards/Stick.gd
	self.team = team
	types = [Type.MELEE]
	points = 3
	cost = 4

func ability(boardState: Array[Card]):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	for i in range(len(boardState)):
		if isAdjacent(boardState[i]):
			output[i].append(Vector2(Card.Modifier.ADD, 2))
	return output
