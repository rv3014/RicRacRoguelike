class_name Stone extends Card


func _init(team):
	name = "Stone"
	types = [Type.RANGED]
	
	self.team = team
	points = 1
	cost = 1

func ability(boardState: Array[Card]):
	return
