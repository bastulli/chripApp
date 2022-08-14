import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

// to do

class FireStoreDataBase {
  String? donwloadURL;

  Future GetData() async {
    try {
      await donwloadURLExampe();
      return donwloadURL;
    } catch (e) {
      print("error - $e");
      return null;
    }
  }

  Future<void> donwloadURLExampe() async {
    donwloadURL = await FirebaseStorage.instance
        .ref()
        .child("data/photo.jpg")
        .getDownloadURL();
    print(donwloadURL.toString());
  }
}
