class_name Flower extends Card

func _init(team):
	name = "Flower"
	self.team = team
	types = [Type.MELEE]
	points = 5
	cost = 5
