import 'package:email_auth/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
 // final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  //
  // User? _userFromFirebase(auth.User? user){
  //   if(user == null){
  //     return null;
  //   }
  //   return User(user.uid, user.email);
  // }
  //
  // Stream<User?>? get async {
  //   return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  // }

  Future signInWithEmailAndPassword(String email,String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
        print(e);
    }
  }
  
  Future signIn(String email,String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print('-----------------------------------------');
      print(e);
      print('-----------------------------------------');
    }
  }
  //
  // Future<User?> createUserWithEmailAndPassword(String email,String password) async {
  //   final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  //   return _userFromFirebase(credential.user);
  // }
  //
  // Future<void> signOut() async {
  //   return await _firebaseAuth.signOut();
  // }

}