class_name Stone extends Card

func _init(team):
	name = "Stone"
	self.team = team
	types = [Type.RANGED]
	points = 1
	cost = 1
	desc = "Do Nothing"
