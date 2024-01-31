import 'package:flutter/material.dart';

class SmallTitle extends StatelessWidget {

  final String text;

  const SmallTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Row(
        children: [
          Text(
              text,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 18, height: 1.8, fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
}