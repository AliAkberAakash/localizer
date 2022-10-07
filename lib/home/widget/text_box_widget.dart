import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.pinkAccent,
        ),
      ),
      height: 100,
      width: 200,
      child: const Text(
        "This is a text",
      ),
    );
  }
}
