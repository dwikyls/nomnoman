// To parse this JSON data, do
//
//     final driveFilesModel = driveFilesModelFromJson(jsonString);

import 'dart:convert';

DriveFilesModel driveFilesModelFromJson(String str) =>
    DriveFilesModel.fromJson(json.decode(str));

String driveFilesModelToJson(DriveFilesModel data) =>
    json.encode(data.toJson());

class DriveFilesModel {
  String nextPageToken;
  String kind;
  bool incompleteSearch;
  List<FileElement> files;

  DriveFilesModel({
    required this.nextPageToken,
    required this.kind,
    required this.incompleteSearch,
    required this.files,
  });

  factory DriveFilesModel.fromJson(Map<String, dynamic> json) =>
      DriveFilesModel(
        nextPageToken: json["nextPageToken"],
        kind: json["kind"],
        incompleteSearch: json["incompleteSearch"],
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nextPageToken": nextPageToken,
        "kind": kind,
        "incompleteSearch": incompleteSearch,
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class FileElement {
  String kind;
  String mimeType;
  String id;
  String name;

  FileElement({
    required this.kind,
    required this.mimeType,
    required this.id,
    required this.name,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        kind: json["kind"],
        mimeType: json["mimeType"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "mimeType": mimeType,
        "id": id,
        "name": name,
      };
}
