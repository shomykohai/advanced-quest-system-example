extends Node

signal item_delivered(item: Item, to: String)


var inventory: Inventory = null

func _ready() -> void:
	await get_tree().process_frame
	# Here I'm using bitbrain's basic inventory implementation.
	# https://github.com/bitbrain/pandora/blob/godot-4.x/examples/inventory/inventory.gd
	# Normally I would have the inventory in an autoload script as a RefCounted/Resource,
	# But in this implementation, the Inventory is a Node, so I have to manually fetch it
	# from the scene tree.
	inventory = Engine.get_main_loop().get_first_node_in_group("Inventory") as Inventory


func is_quest_active(_quest: String) -> bool:
	assert(_quest is String)
	var pandora_quest: PandoraQuest = Pandora.get_entity(_quest) as PandoraQuest
	assert(pandora_quest != null)
	return QuestSystem.is_quest_active(pandora_quest.get_quest())

func is_quest_completed(_quest: String) -> bool:
	assert(_quest is String)
	var pandora_quest: PandoraQuest = Pandora.get_entity(_quest) as PandoraQuest
	assert(pandora_quest != null)
	return QuestSystem.is_quest_completed(pandora_quest.get_quest())


func start_quest(_quest: String) -> Quest:
	assert(_quest is String)
	var pandora_quest: PandoraQuest = Pandora.get_entity(_quest) as PandoraQuest
	assert(pandora_quest != null)
	return QuestSystem.start_quest(pandora_quest.get_quest())


func complete_quest(_quest: String) -> Quest:
	assert(_quest is String)
	var pandora_quest: PandoraQuest = Pandora.get_entity(_quest) as PandoraQuest
	assert(pandora_quest != null)
	return QuestSystem.complete_quest(pandora_quest.get_quest())
