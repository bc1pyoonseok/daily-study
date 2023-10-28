import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Bitcoin',
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).textTheme.titleLarge?.color)),
        const Icon(Icons.currency_bitcoin_sharp, size: 40),
      ],
    );
  }
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  bool showBitcoin = true;
  List<Widget> count_list = [];
  void onPressed() {
    setState(() {
      count++;
      count_list.add(Text('$count'));
    });
  }

  void toggleBitcoin() {
    setState(() {
      showBitcoin = !showBitcoin;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Click Count', style: TextStyle(fontSize: 30)),
                showBitcoin ? const Bitcoin() : const Text("no btc  "),
                Column(
                  children: count_list,
                ),
                IconButton(
                  onPressed: onPressed,
                  iconSize: 40,
                  icon: const Icon(
                    Icons.add_alarm,
                  ),
                ),
                ElevatedButton(
                  onPressed: toggleBitcoin,
                  child: const Text('Toggle Bitcoin'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
