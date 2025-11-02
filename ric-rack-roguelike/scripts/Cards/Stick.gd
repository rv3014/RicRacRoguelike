class_name Stick extends Card


func _init(team):
	name = "Stick"
	types = [Type.MELEE]
	
	self.team = team
	points = 1
	cost = 1
	

func ability(boardState: Array[Card]):
	return
