import 'package:flutter/foundation.dart';
import 'goal.dart';

class GoalManager extends ChangeNotifier {
  final List<Goal> _goals = [];

  List<Goal> get goals => List.unmodifiable(_goals);

  void addGoal(Goal goal) {
    _goals.add(goal);
    notifyListeners();
  }

  void toggleGoalDay(String goalId, int dayIndex) {
    final goal = _goals.firstWhere((g) => g.id == goalId);
    goal.toggleDay(dayIndex);
    notifyListeners();
  }
}
