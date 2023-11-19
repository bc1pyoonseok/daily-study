import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRunning = false;
  int total_seconds = 10;
  int total_success = 0;
  late Timer _timer;

  String formatSeconds(int second) {
    Duration duration = Duration(seconds: second);
    return duration.toString().split('.').first.substring(2, 7);
  }

  void resetTimer() {
    setState(() {
      _timer.cancel();
      total_seconds = 10;
      isRunning = false;
    });
  }

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
        total_success++;
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
              child: Text(formatSeconds(total_seconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
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
                IconButton(
                    onPressed: resetTimer,
                    iconSize: 120,
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Colors.white,
                    )),
              ],
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
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
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
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              total_success.toString(),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
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
