class_name Butterfly extends Card

func _init(team):
	name = "Butterfly"
	self.team = team
	types = [Type.RANGED]
	points = 5
	cost = 5
