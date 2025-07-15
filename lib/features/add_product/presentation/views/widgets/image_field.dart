import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileSelected});
  final ValueChanged<dynamic> onFileSelected;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? _image;
  bool isLoading = false;
  Uint8List? _imageBytes;

  Future<void> pickImage() async {
    setState(() => isLoading = true);
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _imageBytes = await pickedFile.readAsBytes();
        _image = File(pickedFile.path); // Convert to bytes
        kIsWeb
            ? widget.onFileSelected(_imageBytes)
            : widget.onFileSelected(_image);
        setState(() {});
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
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              //height: 200, // Optional height for UI consistency
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: _image != null
                  ? (kIsWeb
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.memory(
                            _imageBytes!,
                            // fit: BoxFit.fill,
                            // width: double.infinity,
                            // height: MediaQuery.of(context).size.height,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            _image!,
                            //fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) => Text(
                              'Failed to load image',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ))
                  : Icon(Icons.add_a_photo, size: 180, color: Colors.grey[600]),
            ),
            Visibility(
              visible: _image != null,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.redAccent),
                onPressed: () {
                  _image = null;
                  _imageBytes = null;
                  widget.onFileSelected(null);
                  setState(() {});
                },
                padding: EdgeInsets.all(8),
                alignment: Alignment.bottomRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
