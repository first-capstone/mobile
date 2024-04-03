import 'package:flutter/material.dart';

void main() {
  runApp(const UnionApp());
}

class UnionApp extends StatelessWidget {
  const UnionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 118, 143, 248)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const UnionHomePage(title: 'Union'),
    );
  }
}

class UnionHomePage extends StatefulWidget {
  const UnionHomePage({super.key, required this.title});

  final String title;

  @override
  State<UnionHomePage> createState() => _UnionHomePageState();
}

class _UnionHomePageState extends State<UnionHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
