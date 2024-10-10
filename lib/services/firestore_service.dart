import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pagination/services/auth_service.dart';

class FirestoreService {
  var db = FirebaseFirestore.instance;

  postFeedback(message) async {
    db.collection('Feedbacks').add(
        {"user": await FirebaseAuthService().checkUser(), "message": message, "photo": "", "created_at": DateTime.now()});
  }
}
