extends GridContainer

const DEFAULT_INVENTORY_ICON = preload("res://addons/pandora/icons/KeyValue.svg")
@export var inventory:Inventory

func _ready() -> void:
	inventory.item_added.connect(handle_item_added)
	inventory.item_removed.connect(handle_item_removed)


func handle_item_added(item: Item, index: int) -> void:
	var slot: TextureRect = get_node("Slot%s" % str(index + 1))
	if slot == null: return
	slot.texture = load(item.get_icon_path())

func handle_item_removed(item: Item, index: int) -> void:
	var slot: TextureRect = get_node("Slot%s" % str(index + 1))
	if slot == null: return
	slot.texture = DEFAULT_INVENTORY_ICON
