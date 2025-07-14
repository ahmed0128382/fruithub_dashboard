import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool isLoading = false;
  Uint8List? _imageBytes;

  Future<void> pickImage() async {
    setState(() => isLoading = true);
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _imageBytes = await pickedFile.readAsBytes(); // Convert to bytes
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      log('Error picking image: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: pickImage,
        child: Container(
          width: double.infinity,
          height: 200, // Optional height for UI consistency
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Center(
            child: _image != null
                ? (kIsWeb
                    ? Image.memory(
                        _imageBytes!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Text(
                          'Failed to load image',
                          style: TextStyle(color: Colors.red),
                        ),
                      ))
                : Text(
                    'Tap to add image',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
          ),
        ),
      ),
    );
  }
}
