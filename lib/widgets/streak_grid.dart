import 'package:flutter/material.dart';
import '../models/goal.dart';

class StreakGrid extends StatelessWidget {
  final Goal goal;
  final Function(int dayIndex) onDayTapped;

  const StreakGrid({
    super.key,
    required this.goal,
    required this.onDayTapped,
  });

  @override
  Widget build(BuildContext context) {
    const int totalDays = 100;
    const int daysPerWeek = 7;
    final int weeks = (totalDays / daysPerWeek).ceil();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(weeks, (weekIndex) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(daysPerWeek, (dayOfWeek) {
              final dayIndex = weekIndex * daysPerWeek + dayOfWeek;
              if (dayIndex >= totalDays) {
                return const SizedBox(width: 24, height: 24); // empty space
              }
              final isCompleted = goal.isDayCompleted(dayIndex);
              return GestureDetector(
                onTap: () => onDayTapped(dayIndex),
                child: Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? goal.category.color
                        : Theme.of(context).cardColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: isCompleted
                          ? goal.category.color.withValues(alpha: 0.8)
                          : Colors.grey.withValues(alpha: 0.2),
                      width: 1,
                    ),
                    boxShadow: isCompleted
                        ? [
                            BoxShadow(
                              color: goal.category.color.withValues(alpha: 0.4),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ]
                        : null,
                  ),
                  child: isCompleted
                      ? const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        )
                      : null,
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
