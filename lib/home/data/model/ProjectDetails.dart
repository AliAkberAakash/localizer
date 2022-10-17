import 'dart:convert';

ProjectDetails projectFromJson(String str) => ProjectDetails.fromJson(json.decode(str));

String projectToJson(ProjectDetails data) => json.encode(data.toJson());

class ProjectDetails {
  ProjectDetails({
    this.languages = const [],
    required this.id,
    this.keys = const [],
    required this.name,
  });

  List<String> languages;
  String id;
  List<String> keys;
  String name;

  factory ProjectDetails.fromJson(Map<String, dynamic> json) => ProjectDetails(
    languages: List<String>.from(json["languages"].map((x) => x)),
    id: json["id"],
    keys: List<String>.from(json["keys"].map((x) => x)),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "id": id,
    "keys": List<dynamic>.from(keys.map((x) => x)),
    "name": name,
  };
}