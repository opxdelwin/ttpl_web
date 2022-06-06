import 'package:firebase_storage/firebase_storage.dart';

class FirebaseMethods{
  final _storage = FirebaseStorage.instance.ref();

  ///storage methods
  Future<String> getDownloadLink(String link)async{
    String url = await _storage.child(link).getDownloadURL();
    return url;
  }
}