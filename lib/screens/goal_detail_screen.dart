import 'package:flutter/material.dart';
import '../models/goal.dart';
import '../models/goal_manager.dart';
import '../widgets/streak_grid.dart';

class GoalDetailScreen extends StatelessWidget {
  final Goal goal;
  final GoalManager manager;

  const GoalDetailScreen({
    super.key,
    required this.goal,
    required this.manager,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: manager,
      builder: (context, child) {
        // Find the updated goal in case it changed
        final updatedGoal = manager.goals.firstWhere((g) => g.id == goal.id, orElse: () => goal);

        final int completedCount = updatedGoal.completedDays.length;
        final double progress = completedCount / 100.0;

        return Scaffold(
          appBar: AppBar(
            title: Text(updatedGoal.title),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: updatedGoal.category.color.withValues(alpha: 0.2),
                      child: Icon(updatedGoal.category.icon, color: updatedGoal.category.color),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            updatedGoal.category.name,
                            style: TextStyle(
                              color: updatedGoal.category.color,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Started on ${updatedGoal.startDate.toLocal().toString().split(' ')[0]}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Why I am doing this:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    updatedGoal.why.isNotEmpty ? updatedGoal.why : 'No reason provided.',
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '100 Days Streak',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$completedCount/100',
                      style: TextStyle(
                        color: updatedGoal.category.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Theme.of(context).cardColor,
                  color: updatedGoal.category.color,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Center(
                    child: StreakGrid(
                      goal: updatedGoal,
                      onDayTapped: (dayIndex) {
                        manager.toggleGoalDay(updatedGoal.id, dayIndex);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
