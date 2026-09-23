# 100 Days Streak App 🚀

A sleek, modern Flutter application designed to help you track your daily goals and build 100-day streaks. Whether you want to hit the gym, save money, learn a new skill, or quit a bad habit, this app keeps you accountable with a beautiful GitHub-style contribution graph!

---

## ✨ Features
- **Custom Goals**: Set your 100-day objective and define your *why*.
- **Smart Categories**: Choose from predefined categories (Gym, Money, Learning, Building, Habit Quitting, Writing, etc.) with custom icons and accent colors.
- **GitHub-style Streak Grid**: Visualize your daily progress with an interactive, scrollable 100-day contribution grid.
- **Modern UI**: A premium dark-mode interface with sleek cards, progress bars, glowing shadows, and polished typography.
- **State Management**: Clean, dependency-free state management using Flutter's built-in `ChangeNotifier` and `ListenableBuilder`.

---

## 📸 Screenshots

> **Note for Developer:** Take 3 screenshots of your app and place them in a folder named `docs` in the root of this project, naming them `home.png`, `add.png`, and `detail.png`.

| Home Screen | Add Goal Screen | Goal Detail (Grid) Screen |
| :---: | :---: | :---: |
| <img src="docs/home.png" width="250" alt="Home Screen"/> | <img src="docs/add.png" width="250" alt="Add Goal Screen"/> | <img src="docs/detail.png" width="250" alt="Goal Detail Screen"/> |
| *View all your active 100-day challenges* | *Create a new goal with a specific category* | *Track your progress on the 100-day grid* |

---

## 🛠️ Tech Stack
- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: Dart
- **Architecture**: Model-View (Separation of UI and Logic)
- **State Management**: `ChangeNotifier`

## 📂 Folder Structure

```text
lib/
├── models/
│   ├── goal.dart                 # Data models & Category Enum Definitions
│   └── goal_manager.dart         # Core state management logic
├── screens/
│   ├── home_screen.dart          # Dashboard showing all active goals
│   ├── add_goal_screen.dart      # Form to create a new 100-day challenge
│   └── goal_detail_screen.dart   # Detailed view featuring the streak grid
├── widgets/
│   └── streak_grid.dart          # Custom GitHub-style 100-day grid widget
└── main.dart                     # App entry point & Theme configuration
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (v3.0.0 or higher)
- Dart SDK

### Installation & Running
1. Clone the repository:
   ```bash
   git clone https://github.com/Rosh-pvr/web_streak_app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd web_streak_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app (on a web server for easy debugging on Windows):
   ```bash
   flutter run -d web-server
   ```
   *Note: Open the localhost URL provided in your terminal in any modern web browser to view the app!*

---

## 🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## 📝 License
This project is licensed under the MIT License.
