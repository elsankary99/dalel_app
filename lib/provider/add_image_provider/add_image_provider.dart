import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'add_image_state.dart';

final getUserInfoProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final res = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final data = await res.get();
  return data.data();
});

final addImageProvider = StateNotifierProvider<AddImageProvider, AddImageState>(
    (ref) => AddImageProvider());

class AddImageProvider extends StateNotifier<AddImageState> {
  AddImageProvider() : super(AddImageInitial());

  final storage = FirebaseStorage.instance;

  final ImagePicker picker = ImagePicker();
  GlobalKey<FormState> editKey = GlobalKey<FormState>();
  File? file;
  String? firstName;
  String? lastName;
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

  Future<void> editUserProfile() async {
    if (editKey.currentState!.validate()) {
      editKey.currentState!.save();
      try {
        state = EditProfileLoading();
        final users = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid);
        await users.set({
          'image_url': imageUrl,
          'first_name': firstName, // John Doe
          'last_name': lastName, // Stokes and Sons
        }, SetOptions(merge: true));
        state = EditProfileSuccess();
      } catch (e) {
        state = EditProfileError(e.toString());
      }
    }
  }
}
