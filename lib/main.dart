import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stateful_project/widgets/icon-text.dart';

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


class InteractivePageState extends State<InteractivePage> {
  Profile profile =
      Profile(firstName: "YourFirstName", lastName: "YourLastName");

  XFile? image;

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    int selectedValue = 0;
    List<int> dropdownItems = List<int>.generate(51, (int index) => index);

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
                      title: const Text('Jeanna Doe', style: TextStyle(fontSize: 18)),
                      trailing:
                          const Text('26 y.o.    ', style: TextStyle(fontSize: 18)),
                    ),
                    const Row(children: [
                      IconTextWidget(iconData: Icons.male, label: "Man"),
                    ]),
                    const Row(children: [
                      IconTextWidget(iconData: Icons.height, label: "160 cm"),
                    ]),
                    const Row(children: [
                      IconTextWidget(iconData: Icons.sports_basketball, label: "travel, Ride"),
                    ]),
                    const Row(children: [
                      IconTextWidget(iconData: Icons.code, label: "Swift"),
                    ]),
                    const Row(children: [
                      IconTextWidget(iconData: Icons.fingerprint, label: "lalala"),
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
                decoration: const InputDecoration(
                    hintText: "Your name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child:
              TextFormField(
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
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems.map<DropdownMenuItem<int>>((int value) {
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
          ],
        ),
      ),
    );
  }
}


