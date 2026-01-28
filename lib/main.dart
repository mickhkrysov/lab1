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
      debugShowCheckedModeBanner: false,
      title: 'Lab1 Timer',
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
        scaffoldBackgroundColor: const Color.fromARGB(255, 100, 183, 62),
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

  //dispose
  @override
 void dispose() {
   _timer?.cancel();
   super.dispose();
 }
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

  /// reset timer
 void _resetTimer() {
   _timer?.cancel();
   setState(() {
     _seconds = 0;
     _isRunning = false;
   });
 }

  String _formatTime(int totalSeconds) {
    final int seconds = totalSeconds % 60;
    return seconds.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer App'),
        backgroundColor: const Color.fromARGB(255, 219, 134, 220),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            Text(
              _formatTime(_seconds),
              style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
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
               ElevatedButton(
                 onPressed: _resetTimer,
                 child: const Text('Reset'),
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