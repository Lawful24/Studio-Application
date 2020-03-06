import 'package:firebase_auth/firebase_auth.dart';
import 'package:studio_application/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  // response when a user signs in or out
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser); // returns FirebaseUsers whenever there is a change in authentication
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.String());
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  //sign out

}