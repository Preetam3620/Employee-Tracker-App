import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'CloudStorageresult.dart';

class CloudStorage {
  Future<CloudStorage> uploadImage({
    @required File imagetoUpload,
    String title,
  }) async {
    var imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    final StorageReference firebasestorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);
    StorageUploadTask uploadTask = firebasestorageRef.putFile(imagetoUpload);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;

    var downloadurl = await storageTaskSnapshot.ref.getDownloadURL();
    if (uploadTask.isComplete) {
      var url = downloadurl.toString();
      // return CloudStorageResult(
      //   imageUrrl: url,
      //   imageFile: imageFileName,
      // );imageFileName
    }
  }
}
