import 'package:flutter/material.dart';

import 'class/profile.dart';

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
      home: const InteractivePage(),
    );
  }
}

class InteractivePage extends StatefulWidget {
  const InteractivePage({super.key});

  @override
  InteractivePageState createState() => InteractivePageState();
}

class InteractivePageState extends State<InteractivePage> {

  Profile profile = Profile(firstName: "YourFirstName", lastName: "YourLastName");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile page",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        elevation: 2,
        shadowColor: Colors.blueGrey[300],
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
    body: const SingleChildScrollView(
      child: Text('hello'),
    ),
    );
  }
}


