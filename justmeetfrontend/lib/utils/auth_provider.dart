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
        //if(utente == null)
        //return false;
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

static Future<String> getImage()async{
  utente = await FirebaseAuth.instance.currentUser();
  return utente.photoUrl;
}

  Future<String> loginWithGoogle() async {
    try {
      GoogleSignInAccount user = await _gAuth.signIn();
      if(user == null)
      return null;
      AuthResult result = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
        accessToken: (await user.authentication).accessToken,
        idToken: (await user.authentication).idToken));
      return result.user.uid;
    } catch (e) {
      print(e);
      return null;
    }
  }
  

  FirebaseUser creaUtenteFirebase(String email, String password){
  AuthResult franco;
   _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => franco = value).catchError(franco = null);
  return franco.user;
}

Future<String> signUp(String email, String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

}