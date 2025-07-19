import 'dart:io';

import 'package:fruithub_dashboard/constants.dart';
import 'package:fruithub_dashboard/core/services/storage_service.dart';
import 'package:fruithub_dashboard/core/utils/keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static createBucket(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExists = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }

    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = basename(file.path);
    String extensionName = extension(file.path);
    var response = await _supabase.client.storage
        .from(fruitBucketName)
        .upload('$path/$fileName.$extensionName', file);
    return response;
  }
}
