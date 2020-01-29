import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> singInWithEmail(String email, String password) async {
    try {
        AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        if(user == null)
        return false;
        return true;
    } catch (e) {
      return false;
    }
  }
  void logOut(){
    _auth.signOut();
  }
}