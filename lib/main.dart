import 'package:flutter/material.dart';
import 'models/goal_manager.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoalManager _manager = GoalManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100 Days Streak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Sleek dark blue
        cardColor: const Color(0xFF1E293B),
        colorScheme: const ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.tealAccent,
          surface: Color(0xFF1E293B),
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(manager: _manager),
    );
  }
}
