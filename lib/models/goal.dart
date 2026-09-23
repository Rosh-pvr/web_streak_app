import 'package:flutter/material.dart';

enum GoalCategory {
  gym,
  money,
  learning,
  building,
  habitQuitting,
  writing,
  somethingElse,
}

extension GoalCategoryExtension on GoalCategory {
  String get name {
    switch (this) {
      case GoalCategory.gym:
        return 'Gym';
      case GoalCategory.money:
        return 'Money';
      case GoalCategory.learning:
        return 'Learning';
      case GoalCategory.building:
        return 'Building';
      case GoalCategory.habitQuitting:
        return 'Habit Quitting';
      case GoalCategory.writing:
        return 'Writing';
      case GoalCategory.somethingElse:
        return 'Something Else';
    }
  }

  IconData get icon {
    switch (this) {
      case GoalCategory.gym:
        return Icons.fitness_center;
      case GoalCategory.money:
        return Icons.attach_money;
      case GoalCategory.learning:
        return Icons.menu_book;
      case GoalCategory.building:
        return Icons.build;
      case GoalCategory.habitQuitting:
        return Icons.smoke_free;
      case GoalCategory.writing:
        return Icons.edit;
      case GoalCategory.somethingElse:
        return Icons.star;
    }
  }

  Color get color {
    switch (this) {
      case GoalCategory.gym:
        return Colors.orangeAccent;
      case GoalCategory.money:
        return Colors.greenAccent;
      case GoalCategory.learning:
        return Colors.blueAccent;
      case GoalCategory.building:
        return Colors.amberAccent;
      case GoalCategory.habitQuitting:
        return Colors.redAccent;
      case GoalCategory.writing:
        return Colors.purpleAccent;
      case GoalCategory.somethingElse:
        return Colors.tealAccent;
    }
  }
}

class Goal {
  final String id;
  final String title;
  final String why;
  final GoalCategory category;
  final DateTime startDate;
  final Set<int> completedDays;

  Goal({
    required this.id,
    required this.title,
    required this.why,
    required this.category,
    required this.startDate,
    Set<int>? completedDays,
  }) : completedDays = completedDays ?? {};

  void toggleDay(int dayIndex) {
    if (dayIndex < 0 || dayIndex >= 100) return;
    if (completedDays.contains(dayIndex)) {
      completedDays.remove(dayIndex);
    } else {
      completedDays.add(dayIndex);
    }
  }
  
  bool isDayCompleted(int dayIndex) {
    return completedDays.contains(dayIndex);
  }
}
