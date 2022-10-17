import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:localizer/home/data/service/firebase_service.dart';
import 'package:localizer/home/widget/text_box_widget.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i=0,j=0;

  final FirebaseService _service = FirebaseService();
  final _logger = Logger();

  List<String> keys = [];
  List<String> languages = [];
  Map<String,Map<String?,String?>> languageMap =  {};

  _HomeScreenState();

  void fetchData() async{
    await _service.getProjectInfo();

    setState(() {
      keys = FirebaseService.projectDetails!.keys;
      languages = FirebaseService.projectDetails!.languages;
      languageMap = FirebaseService.languageMap;

      _logger.d(keys);
      _logger.d(languages);

    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Locaizer"),
      ),
      body: (keys.isNotEmpty && languages.isNotEmpty) ? CrossScroll(
        child:Column(
          children: _generateCols(),
        )
      ) : const SizedBox(),
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
