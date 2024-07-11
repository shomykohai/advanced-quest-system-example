@icon("res://addons/quest_system/assets/quest_resource.svg")
extends Quest
class_name BaseQuestResource

signal step_updated(step: QuestStep)

@export var steps: Array[QuestStep]
@export var rewards: Array[Item]


func start(_args: Dictionary = {}) -> void:
	for step: QuestStep in steps:
		step.ready()
		step.updated.connect(_update_step.bind(step))
	started.emit()

func get_quest_step(index: int) -> QuestStep:
	if index > steps.size():
		printerr("Out of bound. Tried to get QuestStep with index %s in an array of size %s" % [index, steps.size()])
	return steps[index]


func complete_step(index: int) -> Error:
	if index > steps.size():
		printerr("Out of bound. Tried to complete QuestStep with index %s in an array of size %s" % [index, steps.size()])
		return ERR_DOES_NOT_EXIST
	steps[index].completed = true
	return OK


func complete(_args: Dictionary = {}) -> void:
	for step in steps:
		if not step.meets_condition(): break
	if !rewards.is_empty():
		for item: Item in rewards:
			Globals.inventory.add_item(item, Globals.inventory.get_first_empty_index())
	completed.emit()


func get_first_uncompleted_step() -> QuestStep:
	var uncompleted_steps := steps.filter(func(step): return step.completed == false)
	if uncompleted_steps.is_empty(): return null
	return uncompleted_steps[0]


func _update_step(step: QuestStep) -> void:
	step_updated.emit(step)


func serialize() -> Dictionary:
	var steps_data: Dictionary
	for step in steps:
		steps_data[steps.find(step)] = step.serialize()

	var quest_data: Dictionary = {
		"objective_completed": objective_completed,
		"steps": steps_data
	}
	return quest_data


func deserialize(data: Dictionary) -> void:
	if "steps" in data.keys():
		for step in data.steps:
			steps[step].deserialize(data.steps[step])
	data.erase("steps")
	for key in data.keys():
		set(key, data[key])
