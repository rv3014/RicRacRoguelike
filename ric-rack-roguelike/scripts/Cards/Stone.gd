class_name Stone extends Card


func _init(team):
	name = "Stone"
	types = [Type.RANGED]
	
	self.team = team
	

func ability(boardState: Array[Card]):
	return
