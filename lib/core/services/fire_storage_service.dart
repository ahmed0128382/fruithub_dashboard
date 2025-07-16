import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruithub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart';

class FireStorageService implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = basename(file.path);
    String extensionName = extension(file.path);
    var fileRef = storageRef.child('$path/$fileName.$extensionName');

    await fileRef.putFile(file);
    var fileUrl = await fileRef.getDownloadURL();
    return fileUrl;
  }
}
