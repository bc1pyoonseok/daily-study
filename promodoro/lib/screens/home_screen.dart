import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String mock_time = "60:00";
  bool isRunning = false;
  int total_seconds = 10;
  late Timer _timer;
  void resumeTimer() {
    setState(() {
      isRunning = !isRunning;
      if (isRunning) {
        startTimer();
      } else {
        _timer.cancel();
      }
    });
  }

  void onTick(Timer timer) {
    setState(() {
      if (total_seconds < 1) {
        _timer.cancel();
        total_seconds = 10;
        isRunning = false;
      } else {
        total_seconds = total_seconds - 1;
      }
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    setState(() {
      isRunning = true;
    });
    _timer = Timer.periodic(
      oneSec,
      onTick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(total_seconds.toString(),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: isRunning
                  ? IconButton(
                      onPressed: resumeTimer,
                      icon: Icon(
                        Icons.pause_circle,
                        color: Theme.of(context).cardColor,
                      ),
                      iconSize: 120,
                    )
                  : IconButton(
                      onPressed: startTimer,
                      iconSize: 120,
                      icon: Icon(
                        Icons.play_circle_outline,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Text(
                          "Round",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Goal",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
