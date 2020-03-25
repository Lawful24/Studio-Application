import 'package:firebase_auth/firebase_auth.dart';
import 'package:studio_application/models/request.dart';
import 'package:studio_application/models/user.dart';
import 'package:studio_application/services/database.dart';

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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      String title = '';
      String artist = '';
      String date = '';
      String url = '';
      //requests.add(new Request(title: 'asd', artist: 'asd', date: 'asd')); // collection wont be created in firestore
      await DatabaseService(uid: user.uid).updateUserData(title, artist, date, url);
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}