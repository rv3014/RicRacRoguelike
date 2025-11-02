extends Node2D


@export var hand_size:int = 5
@export var starting_hand = [Stick.new(Card.Team.PLAYER), Stick.new(Card.Team.PLAYER), Stick.new(Card.Team.PLAYER), Stone.new(Card.Team.PLAYER), Stone.new(Card.Team.PLAYER), Stone.new(Card.Team.PLAYER)]

@export var CARD_WIDTH:int = 60
@export var CARD_HEIGHT:int = 60
var collection : Array[Card] = []
var displayed_hand:= []
const cardScene = preload("res://scenes/card.tscn")
const shaderScene = preload("res://scenes/pixelate.tscn")
const scriptPath = "res://scripts/Cards/"
const iconPath = "res://assets/icons/"
@onready var hand:= $"."

signal selectedCard

func _ready():
	var deck: Deck = init_Deck()
	create_hand(deck)
	center_hand()
	display_hand()
	create_selectors()
	
	#print(len(collection))
	#for i in collection:
		#print(i.name)
	
	

func init_Deck():
	var deck = Deck.new()
	deck.cards.append_array(starting_hand)
	return deck
	


func create_hand(deck: Deck):
	var card_size = Vector2(CARD_WIDTH, CARD_HEIGHT)
	for i in range(hand_size):
		collection.append(deck.randomCard())
		
		#hand.add_child(card)
		#card.position = Vector2((i - 1)* card_size.x, card_size.y)
		#card.index = i + 1
		#card.connect("_on_card_clicked", print_index)

func display_hand():
	for i in range(hand_size):
		var tempStore = cardScene.instantiate()
		tempStore.set_script(scriptPath + collection[i].name +".gd")
		tempStore.position += Vector2((i - 2) * 100 * 1.778 - 93, 1)
		#tempStore.cardIndex = i
		var iconSprite = Sprite2D.new()
		iconSprite.texture = ImageTexture.create_from_image(Image.load_from_file(iconPath + collection[i].name + ".svg"))
		iconSprite.scale = iconSprite.scale/16
		iconSprite.position += Vector2(20, -65)
		tempStore.add_child(iconSprite)
		hand.add_child(tempStore)
		displayed_hand.append(tempStore)
	return

func create_selectors():
	for i in range(hand_size):
		var card = displayed_hand[i]
		var selector = Button.new()
		selector.size = (Vector2(50,50))
		card.add_child(selector)
		selector.pressed.connect(Callable(self, "select").bind(collection[i]))
	return

func center_hand():
	var viewport_size = get_viewport_rect().size
	print(viewport_size)
	var board_pxl_size = Vector2(hand_size, hand_size)
	
	hand.position.x = (viewport_size/2).x - (board_pxl_size/2).x
	hand.position.y += (4*viewport_size/5).y - (board_pxl_size/2).y

func select(card):
	print("got me!")
	selectedCard.emit(card)

func print_index(index):
	print(index)
	
