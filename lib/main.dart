import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'カウンターアプリ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'カウンターアプリです。',
        subTitle: 'ボタンを押してね',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const int startCount = 0;
  static const int maxCount = 10;

  int _counter = startCount;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = startCount;
    });
  }

  void _shuffleCounter() {
    setState(() {
      _counter = Random().nextInt(maxCount);
    });
  }

  Widget countLabel() {
    if (_counter == maxCount) {
      return Text(
        '$_counter',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 48,
        ),
      );
    }
    return Text(
      '$_counter',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget ghostText() {
    if (_counter == maxCount) {
      return Text(
        '👻',
        style: Theme.of(context).textTheme.headlineMedium,
      );
    }
    return const Text('');
  }

  @override
  Widget build(BuildContext context) {
    // カウントがmaxCountになったら、テキストを赤色にする
    if (_counter == maxCount) {}
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.subTitle),
            countLabel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _counter == startCount ? null : _decrementCounter,
                  tooltip: 'Decrement',
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: _counter == maxCount ? null : _incrementCounter,
                  tooltip: 'Increment',
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: _counter == startCount ? null : _resetCounter,
                  tooltip: 'Reset',
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: _shuffleCounter,
                  tooltip: 'Shuffle',
                  icon: const Icon(Icons.shuffle),
                ),
              ],
            ),
            Column(
              children: [
                ghostText(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
