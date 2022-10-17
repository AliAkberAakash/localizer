import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:localizer/home/data/service/firebase_service.dart';
import 'package:localizer/home/widget/text_box_widget.dart';

const keys = [
  "name",
  "age",
  "address",
];

const languages = [
  "english",
  "spanish",
];

const english = {
  "name":"Name",
  "age":"Age",
  "address":"Address",
};

const spanish = {
  "name":"Nombre",
  //"age":"Años",
  "address":"Dirección",
};

const languageMap = {
  "english" : english,
  "spanish" : spanish,
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i=0,j=0;

  final FirebaseService _service = FirebaseService();

  _HomeScreenState(){
    _service.getProjectInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Locaizer"),
      ),
      body: CrossScroll(
        child:Column(
          children: _generateCols(),
        )
      ),
    );
  }

  List<Widget> _generateCols(){
    List<Widget> children = [];
    for(int k=0; k<keys.length+1; k++) {
      children.add(_getRowItem(k==0 ? "" : keys[k-1]));
      i++;
    }
    return children;
  }

  Widget _getRowItem(String key){
    j = 0;
    List<Widget> children = [];
    for(int k=0; k<languages.length+1; k++) {
      children.add(
        TextBoxWidget(
          i: i,
          j: j,
          value:(k==0) ? key : (key != "") ? languageMap[languages[k-1]]![key] : languages[k-1],
        ),
      );
      j++;
    }
    return Row(
      children: children,
    );
  }

}
