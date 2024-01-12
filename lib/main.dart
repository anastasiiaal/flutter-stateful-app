import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  late TextEditingController textEditingController;
  Color backgroundColor = Colors.red;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: (
                      () => setState(() {
                    backgroundColor = backgroundColor == Colors.red
                        ? Colors.blue
                        : Colors.red;
                  })
              ),
              onLongPress: () => print("Long press!"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  shadowColor: Colors.blue,
                  elevation: 12
              ),
              child: const Text(
                  "Change color!",
                  style: TextStyle(color: Colors.white)
              ),
            )
          ),
          Text(textEditingController.text)
        ],
      ),
    );
  }
}