extends QuestStep
class_name DeliverItemsQuestStep

@export var item: Item
@export var to: PandoraHuman
@export var quantity: int = 1
var gathered: int = 0
var quest = null

func ready() -> void:
	#quest = QuestSystem.get_active_quests().filter(func(q): return self in quest.steps)[0]
	Globals.item_delivered.connect(_on_item_delivered)


func _on_item_delivered(_item: Item, _to: String) -> void:
	if _item._id != item._id or _to != to._id:
		return
	completed = true
	updated.emit()
