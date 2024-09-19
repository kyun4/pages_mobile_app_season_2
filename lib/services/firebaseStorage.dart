import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStoragePagesApp with ChangeNotifier {
  final _firebaseStorage = FirebaseStorage.instance;

  List<String> _imageUrl = [];
  bool is_loading = false;
  bool is_uploading = false;

  List<String> get ImageUrl => _imageUrl;
  bool get _isLoading => is_loading;
  bool get _isUploading => is_uploading;

  Future<void> uploadImage(String image_upload_id) async {
    is_uploading = true;
    notifyListeners();

    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File file = File(image.path);

    try {
      String filePath = 'uploaded_images/${image_upload_id}.png';

      await _firebaseStorage.ref().child(filePath).putFile(file);

      String downloadUrl =
          await _firebaseStorage.ref(filePath).getDownloadURL();

      _imageUrl.add(downloadUrl);
      notifyListeners();
    } catch (e) {
      print("Error uploading..$e");
    } finally {
      is_uploading = false;
      notifyListeners();
    }
  } // uploadImage
}
