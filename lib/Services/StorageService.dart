import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class StorageM {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    try {
      await storage.ref('img/$fileName').putFile(File(filePath));
    } on firebase_core.FirebaseException catch (e) {
      print(e.toString());
    }
  }

  Future<void> uploadFileBytes(Uint8List filePath, String fileName) async {
    try {
      //File file = File(filePath);
      await storage.ref('img/$fileName').putData(filePath);
    } on firebase_core.FirebaseException catch (e) {
      print(e.toString());
    }
  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('img').listAll();
    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file $ref');
    });
    return results;
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('img/$imageName').getDownloadURL();
    return downloadURL;
  }
}
