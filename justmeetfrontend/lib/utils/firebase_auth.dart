import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _gAuth = new GoogleSignIn();
  static FirebaseUser utente;

  Future<bool> singInWithEmail(String email, String password) async {
    try {
        AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        utente = result.user;
        if(utente == null)
        return false;
        return true;
    } catch (e) {
      return false;
    }
  }
  void logOut(){
    _auth.signOut();
  }

static Future<String> getUId() async {
  utente = await  FirebaseAuth.instance.currentUser();
  return utente.uid;
}

  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignInAccount user = await _gAuth.signIn();
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
    
    GoogleSignInAccount newuser = await _gAuth.signIn();
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