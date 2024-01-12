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
  Map<String, bool> sportList = {
    "Basket": false,
    "Boxe": true,
    "Hockey": true,
    "Foot": true,
    "Cricket": true,
    "Danse": true,
  };

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
      body: SafeArea(
        child: generateCheckList(),
      )
    );
  }

  Widget generateCheckList() {

    List<Widget> widgetSportList = [];

    sportList.forEach((label, value) {

      Widget rowItem = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(label),
          Checkbox(
              value: value,
              onChanged: ((newValue) => setState(() {
                sportList[label] = newValue ?? false;
              }))
          )
        ],
      );

      widgetSportList.add(rowItem);
    });

    return Column(children: widgetSportList);
  }
}