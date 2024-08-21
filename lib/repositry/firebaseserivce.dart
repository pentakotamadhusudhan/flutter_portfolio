import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<String?> downloadImage(String imageName) async {
  try {
    var storage = firebase_storage.FirebaseStorage.instance;
    var url = await storage.ref().child('logo.png').getDownloadURL();
    print(url);
    return url;
  } catch (e) {
    print('Error downloading image: $e');
    return null;
  }
}