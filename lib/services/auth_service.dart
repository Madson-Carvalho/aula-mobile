import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  login() async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: "madson_carvalho@estudante.sesisenai.org.br",
          password: "123456");
    } catch (e) {
      rethrow;
    }
  }

  recoverPassword() async {
    try {
      return await auth.sendPasswordResetEmail(
          email: "madson_carvalho@estudante.sesisenai.org.br");
    } catch (e) {
      rethrow;
    }
  }

  checkUser() async {
    var user = auth.currentUser!.displayName;
    return user;
  }
}
