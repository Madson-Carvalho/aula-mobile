import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pagination/services/auth_service.dart';

class FirestoreService {
  var db = FirebaseFirestore.instance;

  postFeedback(message) async {
    try {
      db.collection('Feedbacks').add({
        "user": await FirebaseAuthService().checkUser(),
        "message": message,
        "photo": "",
        "created_at": DateTime.now()
      });
    } catch (e) {
      rethrow;
    }
  }

  getFeedbacks() async {
    try {
      var feedbacks = await db
          .collection('Feedbacks')
          .orderBy('created_at', descending: true)
          .get();

      return (feedbacks.docs);
    } catch (e) {
      rethrow;
    }
  }
}
