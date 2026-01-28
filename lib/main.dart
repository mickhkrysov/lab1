import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 12, 185, 38)),
        useMaterial3: true,
      ),
      home: const TimerPage(),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TimerPage(),
    );
  }

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _seconds = 0;          // elapsed time in seconds
  Timer? _timer;             //the timer
  bool _isRunning = false;   // if timer is running

  /// start
  void _startTimer() {
    if (_isRunning) return; 

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _seconds++;
      });
    });

    setState(() {
      _isRunning = true;
    });
  }

  

  String _formatTime(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer App (Timer.periodic)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Elapsed Time',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              _formatTime(_seconds),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _startTimer,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}