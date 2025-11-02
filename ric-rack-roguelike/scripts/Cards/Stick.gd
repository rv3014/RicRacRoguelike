class_name Stick extends Card

func _init(team):
	name = "Stick"
	self.team = team
	types = [Type.MELEE]
	points = 1
	cost = 1
	desc = "Do Nothing"
