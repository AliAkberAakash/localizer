import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:localizer/home/widget/text_box_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: CrossScroll(
        child:Column(
          children: [
            for(int i=0; i<50; i++)
              Row(
                children: [
                  for(int i=0; i<50; i++)
                    const TextBoxWidget(),
                ],
              )
          ],
        )
      ),
    );
  }
}
