import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {

  final int i,j;
  String? value;
  TextBoxWidget({Key? key, required this.i, required this.j, this.value = ""}) : super(key: key){
    controller.text=value ?? "";
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.pinkAccent,
        ),
        color: (i==0) ? Colors.pinkAccent.withOpacity(0.1) : (j==0) ? Colors.pinkAccent.withOpacity(0.1) : Colors.white,
      ),
      height: 50,
      width: 200,
      child: (i==0&&j==0) ? const SizedBox(
        height: 100,
        width: 200,
      ) : TextField(
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        key: UniqueKey(),
        controller: controller,
      ),
    );
  }
}
