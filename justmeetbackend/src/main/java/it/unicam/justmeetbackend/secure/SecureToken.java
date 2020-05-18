package it.unicam.justmeetbackend.secure;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;

public class SecureToken {

	private static SecureToken instance;

	public String getUid(String token) throws FirebaseAuthException {
		FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdToken(token);
		String uid = decodedToken.getUid();
		return uid;
	}
	public static SecureToken getInstance() {
		if (instance == null) {
			instance = new SecureToken();
		}
		return instance;
    }
}