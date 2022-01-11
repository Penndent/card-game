extends CanvasLayer

onready var inputManager = get_node('/root/World/InputManager')
onready var worldNode = get_node('/root/World')
onready var itemList = $ItemList

const archer_card = preload("res://Cards/Archer.tscn")
const knight_card = preload("res://Cards/Knight.tscn")
const witch_card = preload("res://Cards/Witch.tscn")

#Icons
const archer_icon = preload("res://Assets/round archer.png")
const knight_icon = preload("res://Assets/round knight.png")
const witch_icon = preload("res://Assets/round witch.png")

const icon_list = {
	'archer': archer_icon,
	'knight': knight_icon,
	'witch': witch_icon,
}

func _on_move_Button_pressed():
	inputManager.change_state(0)
func _on_attack_Button_pressed():
	inputManager.change_state(1)
func _on_ability_Button_pressed():
	inputManager.change_state(2)
func _on_end_turn_pressed():
	worldNode.end_turn()

func _ready():
	pass
	#itemList.add_item('Archer', archer_icon, true)
	#itemList.add_item('Archer', witch_icon, true)
	#itemList.add_item('Archer', knight_icon, true)
	#itemList.add_item('Archer', archer_icon, true)
	#itemList.add_item('Archer', witch_icon, true)
	#var thing = ['witch', 'archer', 'knight', 'witch', 'archer']
	#show_cards(thing)x


#TODO
func show_cards(pool):
	for x in pool.size():
		var newCard = pool.pop_back()
		itemList.add_item(newCard, icon_list[newCard], false)
