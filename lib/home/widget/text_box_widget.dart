import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {

  final int i,j;
  String value;
  TextBoxWidget({Key? key, required this.i, required this.j, this.value = ""}) : super(key: key){
    controller.text=value;
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: (i==0) ? Colors.black : (j==0) ? Colors.black : Colors.pinkAccent,
        ),
      ),
      height: 50,
      width: 200,
      child: (i==0&&j==0) ? Container(
        decoration: const BoxDecoration(
          color: Colors.pinkAccent,
        ),
        height: 100,
        width: 200,
      ) : TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        key: UniqueKey(),
        controller: controller,
      ),
    );
  }
}
