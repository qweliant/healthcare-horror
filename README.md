# Healthcare Horror

A short first-person horror game made in Godot for the [Avant Beettle Protest Game Jam](https://itch.io/jam/avantbeetles-protest-games-jam).

## About

You wake in a hospital. Checkout does not go as hoped. When the numbers on the bill stop making sense, another kind of offer arrives. Night work that pays enough to chip away at the debt, if you don't asking questions.

The game moves between the hospital, scripted rides between sites, and three job locations. This game is dialogue driven with a PS1-inspired visual style.

## Requirements

- [Godot 4.6](https://godotengine.org/download) (the project targets the `4.6` feature set in `project.godot`; use the matching editor version to avoid upgrade prompts).

## Run the project

1. Clone this repository (or download a ZIP).
2. In Godot, use **Project → Import** and select the folder that contains `project.godot`, or **Project → Open** if you already imported it.
3. Press **F5** (or **Project → Run Project**). The main scene is `scenes/hospital/hospital.tscn`.

No extra build step is required; this is a vanilla Godot 4 project.

## Controls

| Action | Input |
|--------|--------|
| Move | **W A S D** |
| Look | **Mouse** (captured in-game) |
| Interact | **E** |
| Advance dialogue | **Space** or **left mouse button** |
| Release / recapture mouse | **Escape** |

## Project layout (high level)

- `scenes/` — main flow: hospital, car ride, three jobs, ending.
- `scripts/` — player, interactables, dialogue, job sequences, game.
- `ui/` — dialogue box scene.
- `shaders/` — low-poly / PS1-style post and effects.

## Author

[Damali Boyd](https://github.com/damaliboyd)
[Qwelian Tanner](https://github.com/qweliant)

## License

There is no `LICENSE` file in this repository yet. If you plan to distribute builds or source, add a license that fits how you want the game shared.
