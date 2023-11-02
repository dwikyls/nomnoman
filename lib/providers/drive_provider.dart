import 'package:flutter/material.dart';
import 'package:nomnoman/models/DriveFilesModel.dart';
import 'package:nomnoman/utils/api.dart';

class DriveProvider extends ChangeNotifier {
  DriveFilesModel? files;

  FileElement findFileById(String id) {
    return files!.files.firstWhere((file) => file.id == id);
  }

  Future<void> fetchAndSetDriveFiles() async {
    try {
      final response = await getWithAuth("/drive/v3/files/", options: {
        "method": "GET",
        "headers": {
          'Accept': 'application/json',
        },
      });

      print(response.statusCode);

      if (response.statusCode == 200) {
        // print(response.data);
        files = DriveFilesModel.fromJson(response.data);
        notifyListeners();
      } else {
        if (response.statusCode == 401) {
          throw 'credential error';
        }

        throw 'internal error';
      }
    } catch (error) {
      rethrow;
    }
  }
}
