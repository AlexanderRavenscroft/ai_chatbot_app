import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Simple Counter App')),
        body: Center(
          child: CounterButton(),
        ),
      ),
    );
  }
}

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  CounterButtonState createState() => CounterButtonState();
}

class CounterButtonState extends State<CounterButton> {
  String counter = 'Welcome Jelly';

  Future<void> _incrementCounter() async {
    try {
  final response = await http.get(Uri.parse('http://192.168.0.17:50162/increment'));
  if (response.statusCode == 200) {
    setState(() {
      counter = response.body;
    });
  }
} on Exception catch (e) {
    print(e);
}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Counter: $counter', style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }
}