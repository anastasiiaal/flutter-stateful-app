import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stateful_project/widgets/icon-text.dart';
import 'package:stateful_project/widgets/small_title.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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

enum Gender { male, female }

class InteractivePageState extends State<InteractivePage> {
  Profile profile =
      Profile(firstName: "YourFirstName", lastName: "YourLastName");

  XFile? image;
  double _currentSliderValue = 130;
  Gender? _gender = Gender.male;
  int ageValue = 0;
  List<int> ageDropdown = List<int>.generate(101, (int index) => index);
  String _firstName = '';
  String _lastName = '';

  void changeName(String newName) {
    setState(() {
      _firstName = newName;
    });
  }

  void changeLastName(String newName) {
    setState(() {
      _lastName = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    Future<void> pickImage(ImageSource source) async {
      try {
        final pickedFile = await picker.pickImage(source: source);
        if (pickedFile != null) {
          setState(() {
            image = pickedFile;
          });
        }
      } catch (e) {
        print('Error occurred while picking image: $e');
      }
    }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                      leading: image == null
                          ? const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 54) :
                      CircleAvatar(
                          backgroundImage: Image.file(File(image!.path)).image,
                          radius: 54),
                      title: Text('$_firstName $_lastName', style: const TextStyle(fontSize: 18)),
                      trailing:
                          Text('$ageValue y.o.    ', style: const TextStyle(fontSize: 18)),
                    ),
                    Row(children: [
                      IconTextWidget(iconData: Icons.male, data: '$_gender', label: ""),
                    ]),
                    Row(children: [
                      IconTextWidget(iconData: Icons.height, data: '${_currentSliderValue.round()}', label: " cm"),
                    ]),
                    const Row(children: [
                      IconTextWidget(iconData: Icons.sports_basketball, data: "travel, Ride", label: ""),
                    ]),
                    const Row(children: [
                      IconTextWidget(iconData: Icons.code, data: "Swift", label: ""),
                    ]),
                    const Row(children: [
                      IconTextWidget(iconData: Icons.fingerprint, data: "hidden text", label: ""),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () => pickImage(ImageSource.gallery),
                            child: Icon(Icons.browse_gallery,
                                color: Colors.blue[800],
                                size: 22,
                                semanticLabel:
                                    'Text to announce in accessibility modes'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () => pickImage(ImageSource.camera),
                            child: Icon(Icons.camera_alt,
                                color: Colors.blue[800],
                                size: 22,
                                semanticLabel:
                                    'Text to announce in accessibility modes'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child:
              TextFormField(
                onChanged: changeName,
                decoration: const InputDecoration(
                    hintText: "Your name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child:
              TextFormField(
                onChanged: changeLastName,
                decoration: const InputDecoration(
                    hintText: "Your last name"
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child:
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text('Select your age',
                        style: TextStyle(fontSize: 18, height: 1.8)
                    )
                  ),
                  const SizedBox(width: 60),
                  Expanded(
                      flex: 1,
                      child: DropdownButton(
                        value: ageValue,
                        onChanged: (newValue) {
                          setState(() {
                            ageValue = newValue!;
                          });
                        },
                        items: ageDropdown.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        isExpanded: true,
                      ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child:
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Secret text"
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SmallTitle(text: "I am ..."),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Man'),
                        leading: Radio<Gender>(
                          value: Gender.male,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Woman'),
                        leading: Radio<Gender>(
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ]
                ),
            ),
            const SmallTitle(text: "I measure ..."),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Slider(
                value: _currentSliderValue,
                min: 130,
                max: 220,
                divisions: 90, // Adjust the number of divisions for granularity
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


