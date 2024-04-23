import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../models/models.dart';

class CloudStorageService {
  Future<CloudStorageResult?> uploadImage(
      {required File image, required String title}) async {

    var imageFileName =
        title + DateTime.now().microsecondsSinceEpoch.toString();
    final Reference storageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    UploadTask uploadTask = storageRef.putFile(image);
    uploadTask.whenComplete(() async {
      var downloadUrl = await storageRef.getDownloadURL();
      return CloudStorageResult(imageFileName, downloadUrl);
    });

    return null;
  }
}
