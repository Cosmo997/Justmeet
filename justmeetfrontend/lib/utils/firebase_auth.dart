import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn google = new GoogleSignIn();
      GoogleSignInAccount user = await google.signIn();
      if(user == null)
      return false;
      AuthResult result = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
        accessToken: (await user.authentication).accessToken,
        idToken: (await user.authentication).idToken));
      if(result.user == null)
      return false;
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<FirebaseUser> singinWithGoogle() async {
    GoogleSignIn google = new GoogleSignIn();
    GoogleSignInAccount newuser = await google.signIn();
    if(newuser == null)
    return null;
    AuthResult result = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
      accessToken: (await newuser.authentication).accessToken,
      idToken: (await newuser.authentication).idToken
    ));
    return result.user;
  }
bool creaUtenteFirebase(String email, String password){
  try 
  {
     _auth.createUserWithEmailAndPassword(email: email, password: password);
     return true;
  }
  catch (e) 
  {
  return false;
  }
}

}