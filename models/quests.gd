@tool
extends PandoraEntity
class_name PandoraQuest

func get_quest() -> Quest:
	return get_resource("Quest Resource") as Quest

func start(args: Dictionary = {}) -> Quest:
	var quest: Quest = get_quest()
	assert(quest != null)
	QuestSystem.start_quest(quest, args)
	return quest


func complete(args: Dictionary = {}) -> Quest:
	var quest: Quest = get_quest()
	assert(quest != null)
	QuestSystem.complete_quest(quest, args)
	return quest


func update(args: Dictionary = {}) -> Quest:
	var quest: Quest = get_quest()
	assert(quest != null)
	QuestSystem.update_quest(quest, args)
	return quest


func call_method(args: Dictionary = {}) -> Quest:
	var quest: Quest = get_quest()
	assert(quest != null)
	QuestSystem.update_quest(quest, args)
	return quest


func serialize() -> Dictionary:
	var quest: Quest = get_quest()
	assert(quest != null)
	return quest.serialize()
