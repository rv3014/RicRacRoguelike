class_name Spear extends Card

func _init(team):
	name = "Spear"
	self.team = team
	types = [Type.MELEE, Type.RANGED]
	points = 2
	cost = 2
