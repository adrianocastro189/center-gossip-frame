# Center Gossip Frame

**⚠️ NOV 11, 2024 - THIS PROJECT IS PAUSED FOR AN INDEFINITE PERIOD:** Due to other dev
priorities requiring my attention in recent weeks, I have decided to pause the development
of Center Gossip Frame. I greatly appreciate all the support and feedback received
so far and intend to resume work as soon as I complete the ongoing projects.

Center Gossip Frame centralizes the following frames on the screen:

* Gossip windows in general
* Merchant windows
* Quest frames to accept, complete, and turn in quests
* Taxi frame from the flight master
* Trainer frames

This addon was designed to make it easier for players to interact with NPCs
and quest givers by centralizing the frames that are usually displayed on the
left side of the screen and that can be hard to see when the player is using
a large and wide monitor.

## ❤️ Support this project

If you like this addon and want to support its development, you can
[buy the author a coffee](https://github.com/sponsors/adrianocastro189).

Every contribution or subscription is deeply appreciated and also supports
the [Stormwind Library project](https://github.com/adrianocastro189/stormwind-library),
which is the framework used to build this addon.

## How to use this addon

Just install the addon and it will automatically centralize the frames above.

## Available commands

For now, there are no commands available for this addon.

## What's on the roadmap for the next versions

* **Cover more frames:** I'm aware there are lots of frames that could be also
  centralized, but they'll be added in future versions.
* **Automatic repositioning:** In some cases, players may want to preview the
  quest rewards before turning in the quest. In these cases, the game will add
  a closet on the right side of the quest frame and move it back to the left
  side. Automatic repositionings like those are not yet supported by the addon.
* **Option to disable the addon:** There is no option to disable the addon
  in-game. Players who want to disable it will need to deactivate it.

## Known issues

(None)

## Changelog

### 2024.09.11 - version 1.3.0

* Internal improvements to the centralization process
* Update Stormwind Library to version 1.13.0

### 2024.08.21 - version 1.2.0

* New frames covered: Trainer Frame for learning class skills (Classic only) and
  profession skills (all versions)
* Fix an incompatibility issue with TradeSkillMaster that was causing the merchant 
  frame to be displayed twice on the screen when it was overriden by TSM UI
* Update Stormwind Library to version 1.12.1

### 2024.07.24 - version 1.1.1

* Update TOC interface number for Retail

### 2024.07.19 - version 1.1.0

* A complete refactor of the centralization process to prevent edge cases 
  where the frames weren't being centralized properly due to race conditions 
  between the events that trigger the centralization and the frames being 
  repositioned by the game
* Add a sanity check to the centralization function to avoid errors when frames
  can't be found or moved
* New frames covered: Taxi Frame from the flight master and merchant windows
* Update Stormwind Library to version 1.9.0

### 2024.07.11 - version 1.0.1

* Update TOC interface number for Classic Era

### 2024.06.27 - version 1.0.0

* First version of the addon covering the Gossip and Quest frames
