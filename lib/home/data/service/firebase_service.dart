import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class FirebaseService {

  final _logger = Logger();
  static const String projectRoot = "projects";
  static const  String projectName = "refueling";
  static const  String projectId = "refueling";

  FirebaseService();

  Future<void> getProjectInfo() async{

    final db = FirebaseFirestore.instance;

    await db.collection(projectRoot)
      .doc(projectId)
      .get().then((event) {
        _logger.d(event.data());
    });

  }

}