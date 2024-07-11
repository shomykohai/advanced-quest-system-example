extends QuestStep
class_name GatherItemsQuestStep

@export var item: Item
@export var quantity: int = 1
var gathered: int


func ready() -> void:
	Globals.inventory.item_added.connect(_on_item_added)
	Globals.inventory.item_removed.connect(_on_item_removed)
	gathered = Globals.inventory.get_item_count(item)
	meets_condition()

func meets_condition() -> bool:
	if gathered >= quantity:
		completed = true
		return true
	return false

func _on_item_added(gathered_item: Item, _index: int) -> void:
	if gathered_item._id == item._id and not completed:
		gathered += 1
		updated.emit()
	meets_condition()

func _on_item_removed(gathered_item: Item, _index: int) -> void:
	if gathered_item._id == item._id and not completed:
		gathered -= 1
		updated.emit()
	meets_condition()
