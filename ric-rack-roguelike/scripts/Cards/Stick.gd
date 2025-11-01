class_name Stick extends Card


func _init(team):
	name = "Stick"
	types = [Type.MELEE]
	
	self.team = team
	

func ability(boardState: Array[Card]):
	return
