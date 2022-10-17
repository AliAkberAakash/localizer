import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localizer/home/data/model/ProjectDetails.dart';
import 'package:logger/logger.dart';

class FirebaseService {

  final _logger = Logger();

  static const String projectRoot = "projects";
  static const  String projectName = "refueling";
  static const  String projectId = "refueling";
  static const  String collectionId = "languageMap";
  static ProjectDetails? projectDetails;
  static Map<String,Map<String?,String?>> languageMap = {};

  FirebaseService();

  Future<void> getProjectInfo() async{

    final db = FirebaseFirestore.instance;

    await db.collection(projectRoot)
      .doc(projectId)
      .get().then((event) {
        _logger.d(event.data());
        if(event.data() != null) {
          projectDetails =  ProjectDetails.fromJson(event.data()!);
        }
      });

    await db.collection(projectRoot)
      .doc(projectId)
      .collection(collectionId)
      .get().then((event) {
        for(var doc in event.docs){
          _logger.d(doc.data());
          languageMap[doc.id] = doc.data().cast();
        }
      });

  }

}