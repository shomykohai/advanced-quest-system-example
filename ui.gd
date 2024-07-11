extends CanvasLayer

func _ready() -> void:
	QuestSystem.quest_accepted.connect(format_quest_label)
	QuestSystem.quest_completed.connect(format_quest_label)


func format_quest_label(_quest: Quest):
	var quests = QuestSystem.get_active_quests()
	var names := []
	for q: BaseQuestResource in quests:
		# Here with some more advanced code, it's possibile to display the current steps instead of
		# The quest objective. To get the first step to complete, do `q.get_first_uncompleted_step()`
		names.append(q.quest_objective)
	$CurrentQuest.text = "Current quests:\n[color=cyan]{quests}[/color]".format({"quests": "\n".join(names)})
