class_name Deck

var cards : Array[Card] = []
var used : Array[Card] = []

func randomCard():
	if len(cards) == 0:
		cards = used	
	var i = randi_range(0, len(cards) - 1)
	var card = cards.pop_at(i)
	used.append(card)
	return card
