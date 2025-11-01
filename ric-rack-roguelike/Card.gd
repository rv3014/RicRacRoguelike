class_name Card

enum Team {PLAYER, ENEMY}
enum Type {MELEE, RANGED}

var boardsize

var name : String
var x : int
var y: int
var position: Vector2 = Vector2(x, y)
var team : Team
var types : Array[Type]

#func isValid(postion: Vector2):
	#return (0 <= position.x and position.x <= 2) and (0 <= position.y and position.y <= 2)

func isOrthogonal(otherCard: Card):
	var otherPosition: Vector2 = otherCard.position
	if (x == otherPosition.x  and (y == otherPosition.y + 1 or y == otherPosition.y - 1)) :
		return true
	if (y == otherPosition.y  and (x == otherPosition.x + 1 or x == otherPosition.x - 1)):
		return true
	if (x == otherPosition.x + 1 or x == otherPosition.x - 1) and (y == otherPosition.y + 1 or y == otherPosition.y - 1):
		return true
	return false
	
func isAdjacent(otherCard: Card):
	return false
	
	
func isInCorner(otherCard: Card):
	return false
	
func isInWinLine(otherCard: Card, isWin: bool):
	return false
	
func isInMiddle(otherCard: Card):
	return otherCard.position == Vector2(1, 1)
	
func isInColumn(otherCard: Card, col: int):
	return false
	
func isInRow(otherCard: Card, row: int):
	return false
	
func isRanged(otherCard: Card):
	for type in otherCard.types:
		if type == Type.RANGED:
			return true
	return false
	
func isMelee(otherCard: Card):
	for type in otherCard.types:
		if type == Type.MELEE:
			return true
	return false
	
func isPlayer(otherCard: Card):
	return otherCard.team == Team.PLAYER
	
func isEnemy(otherCard: Card):
	return otherCard.team == Team.ENEMY
	

	
	

func ability(boardState):
	#input = array of cards in board
	#output = array of arrays of tuples(AMOUNT, OPERATION)
	return
