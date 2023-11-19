import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'add_image_state.dart';

final addImageProvider = StateNotifierProvider<AddImageProvider, AddImageState>(
    (ref) => AddImageProvider());

class AddImageProvider extends StateNotifier<AddImageState> {
  AddImageProvider() : super(AddImageInitial());

  final storage = FirebaseStorage.instance;

  final ImagePicker picker = ImagePicker();
  File? file;
  String? imagePath;
  String? imageUrl;
  Future<void> getImage(ImageSource source) async {
    try {
      final image = await picker.pickImage(source: source);
      if (image != null) {
        state = AddImageLoading();
        log("AddImageLoading");

        imagePath = image.path;
        file = File(image.path);
        await uploadImage();
        state = AddImageSuccess();
        log("AddImageSuccess");
      }
    } catch (e) {
      state = AddImageError(e.toString());
      log("AddImageError ${e.toString()}");
    }
  }

  uploadImage() async {
    final imagePlace = storage
        .ref("User_Images")
        .child(FirebaseAuth.instance.currentUser!.uid);
    await imagePlace.putFile(file!);
    imageUrl = await imagePlace.getDownloadURL();
    log("$imageUrl");
  }
}
