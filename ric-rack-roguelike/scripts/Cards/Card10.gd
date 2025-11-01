class_name Sword extends Card


func _init(team):
	name = "Sword"
	types = [Type.MELEE]
	
	self.team = team
	

func ability(boardState: Array[Card]):
	return
