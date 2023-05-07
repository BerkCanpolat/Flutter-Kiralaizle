import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static StorageService instance = StorageService();

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadUserImage(File image) async {
    String userUid = FirebaseAuth.instance.currentUser!.uid;
    TaskSnapshot taskSnapshot =
        await _firebaseStorage.ref(userUid).putFile(image);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
