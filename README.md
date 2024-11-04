<h1  align="center">
<image src="./splash.png" alt="Dialogue Manager + QuestSystem + Pandora"><br>
Advanced guide to dialogue and quests in Godot 4
</h1>

**This project is based on Nathan's [beginner dialogue tutorial](https://github.com/nathanhoad/beginner_godot4_dialogue).**

In this example project, a more advanced use of [QuestSystem](https://github.com/shomykohai/quest-system) is shown. Particularly, it is used in combo with Nathan's [Dialogue Manager](https://github.com/nathanhoad/godot_dialogue_manager) and bitbrain's [Pandora](https://github.com/bitbrain/pandora).

<image src="docs/screen.png">

## Useful informations

### Quests
In this demo, instead of extending `Quest` for making a different kind of quest (as did in [quest-system-example](https://github.com/shomykohai/quest-system-example)), there's a general script that inherits Quest called `BaseQuestResource`.<br>
In particular, `BaseQuestResource` allows to attach different steps, that as in many RPG games has to be completed one by one to consider the quest completed.<br>
This approach follows the composition pattern instead of the inheritance one presented in [quest-system-example](https://github.com/shomykohai/quest-system-example).

The code related to quests is stored in [the quest directory](/quests/)


### Dialogues

The dialogues are stored under [dialogue](/dialogue/).<br>

The code for the balloon comes from [one](https://github.com/nathanhoad/godot_dialogue_manager/tree/main/examples/portraits_balloon) of [@nathanhoad](https://github.com/nathanhoad) examples.<br>
In this example, [globals.gd](/globals.gd) is set as a shortcut in Dialogue Manager settings.

### Items & Data

All data in this project is handled using Pandora, from NPCs to items and quests.<br>
Head to the Pandora tab to see how the data is structured.<br>

The interested directories for pandora related stuff are [pandora](/pandora/), [models](/models/) and [inventory](/inventory/).


## License

This project is under the MIT License, see `LICENSE` for more information.<br>

This project include third parties addons, assets and code:<br>
Code & addons:
* [Pandora](https://github.com/bitbrain/pandora), by [@bitbrain](https://github.com/bitbrain), under the [MIT License](/addons/pandora/LICENSE)
* [QuestSystem](https://github.com/shomykohai/quest-system), by [@shomykohai](https://github.com/shomykohai), under the [MIT License](/addons/quest_system/LICENSE)
* [Dialogue Manager](https://github.com/nathanhoad/godot_dialogue_manager), by [@nathanhoad](https://github.com/nathanhoad), under the [MIT License](/addons/dialogue_manager/LICENSE)
* [Inventory code](/inventory/), by [@bitbrain](https://github.com/bitbrain), from Pandora repository, also under MIT License

Assets:
* "Nathan" portrait is property of [@nathanhoad](https://github.com/nathanhoad)<br>
* "bitbrain" portrait is property of [@bitbrain](https://github.com/bitbrain)<br>
* "Coco" portrait is property of [@nathanhoad](https://github.com/nathanhoad) and [@littlenebula](https://github.com/littlenebula) (in particular this is a screenshot from this [video](https://www.youtube.com/watch?v=ixWkc2rKJEQ&t=1s))<br>
* All items assets under the [inventory](/inventory/) directory, apart from [apple.svg](/inventory/icons/apple.svg) are property of [@bitbrain](https://github.com/bitbrain)

Logos:
* Pandora and Dialogue Manager logos by [@nathanhoad](https://github.com/nathanhoad)