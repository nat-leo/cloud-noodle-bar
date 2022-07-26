import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImage(String imageUrl) async {
  final storageRef = FirebaseStorage.instance.ref();
  final imageRef = storageRef.child(imageUrl);

  try {
    return imageRef.getDownloadURL();
  } on FirebaseException catch (e) {
    throw Exception(e);
  }
}