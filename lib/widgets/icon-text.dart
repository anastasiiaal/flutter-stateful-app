import 'package:flutter/cupertino.dart';

class IconTextWidget extends StatelessWidget {

  final IconData iconData;
  final String data;
  final String label;

  const IconTextWidget({super.key, required this.iconData, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 16),
          child: Icon(iconData, size: 26),
        ),
        Text(data, style: const TextStyle(fontSize: 18, height: 1.8)),
        Text(label, style: const TextStyle(fontSize: 18, height: 1.8))
      ],
    );
  }

}