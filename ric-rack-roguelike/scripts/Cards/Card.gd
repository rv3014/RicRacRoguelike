class_name Card

enum Team {PLAYER, ENEMY}
enum Type {MELEE, RANGED}
enum Modifier {MULT, ADD}

var x : int
var y: int
var position: Vector2 = Vector2(x, y)

var name : String
var team : Team
var types : Array[Type]
var points: int
var cost: int

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
	var otherPosition: Vector2 = otherCard.position
	if (x == otherPosition.x  and (y == otherPosition.y + 1 or y == otherPosition.y - 1)) :
		return true
	if (y == otherPosition.y  and (x == otherPosition.x + 1 or x == otherPosition.x - 1)):
		return true
	return false
	
func isInCorner(otherCard: Card):
	return otherCard.x != 1 and otherCard.y != 1
	
func isInWinLine(otherCard: Card):
	return false
	
func isInMiddle(otherCard: Card):
	return otherCard.position == Vector2(1, 1)
	
func isInColumn(otherCard: Card, col: int):
	return otherCard.x == col
	
func isInRow(otherCard: Card, row: int):
	return otherCard.y == row
	
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

func isMyEnemy(otherCard: Card):
	return otherCard.team != team

func isMe(otherCard: Card):
	return otherCard.position == position

func ability(boardState):
	var output = []
	output.resize(len(boardState))
	output.fill([])
	return output
