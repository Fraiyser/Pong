# Pong

A classic arcade Pong game built with **Godot 4 (GDScript)**. Challenge the AI in a fast-paced match of table tennis with increasing difficulty.

## 🎮 Features

- **Arcade Gameplay** – Classic Pong mechanics with smooth ball physics and bounce logic.
- **AI Opponent** – The computer-controlled paddle adapts to the ball’s movement.
- **Match System** – Play up to 6, 12, or 16 points (configurable in settings).
- **Difficulty Modes** – Switch between **Easy** and **Hard** AI speed.
- **Pause & Audio** – Game pauses on goals, with sound cues for scoring and victory.
- **Main Menu & UI** – User-friendly interface with settings and replay options.

## 🕹️ Controls

| Action        | Input          |
|---------------|----------------|
| Move Left     | **A** key      |
| Move Right    | **D** key      |
| Open Menu     | **ESC**        |

## 🧠 What I Learned

- **State Management** – `get_tree().paused` for goal/freeze states.
- **Scene Management** – Swapping scenes (`main_menu` ↔ `game`).
- **Signals** – Custom signals (`game_ended`) for decoupling game logic from UI.
- **Singleton (Autoload)** – `Global.gd` for storing game settings across scenes.
- **Input Handling** – Using `Input.get_axis("left", "right")` for smooth paddle movement.
- **Collision Detection** – Distinguishing between `area_entered` and `body_entered` for paddles vs. walls.

## 🛠️ Technologies

- **Engine:** Godot 4.6 
- **Language:** GDScript  
- **Version Control:** Git & GitHub

## 📦 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Fraiyser/Pong.git
Open the project in Godot 4.6 or newer.

Run the main scene (main_menu.tscn).

📄 License
This project is open-source and available under the MIT License.

Made with 💙 as part of my journey to master game development.