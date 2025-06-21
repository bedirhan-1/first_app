import 'package:flutter/material.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Counter App",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  // sayacın değerini güncellemek için bir tane
  // arttırma bir tane de azaltma fonksiyonu yazacağım

  // setState fonksiyonu benim widget'ımı güncellememi sağlıyor.
  // eğer setState içinde yazmazsam widget güncellenmez.

  // azaltma fonksiyonu:
  void decrement() {
    setState(() {
      counter--;
    });
  }

  // arttırma fonksiyonu:
  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            counter.toString(),
            style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => decrement(),
                icon: Icon(Icons.remove),
              ),
              IconButton(onPressed: () => increment(), icon: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
