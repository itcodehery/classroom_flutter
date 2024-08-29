import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'auth_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier()
      : super(AuthState(
            isAuthenticated: FirebaseAuth.instance.currentUser != null)) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      state = AuthState(isAuthenticated: user != null);
    });
  }

  Future<void> createUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((c) {
        state = AuthState(isAuthenticated: true);
      });
    } on Exception catch (e) {
      debugPrint("Error while creating user, retry again! ${e.toString()}");
    }
  }

  Future<void> loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((v) {
        state = AuthState(isAuthenticated: true);
      });
    } on Exception catch (e) {
      debugPrint("Error while logging in, retry again! ${e.toString()}");
      if (mounted) {
        toastification.show(
            context: context,
            alignment: Alignment.bottomCenter,
            style: ToastificationStyle.simple,
            title: Text(
                "Error: ${e.toString().contains('invalid-credential') ? 'Invalid credentials' : 'Unknown error occured!'}"));
      }
    }
  }

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      //obtains sign in details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      state = AuthState(isAuthenticated: true);

      return userCredential;
    } catch (e) {
      debugPrint(
          "Error while logging in with Google, retry again! ${e.toString()}");
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    state = AuthState(isAuthenticated: false);
  }

  //get current user details
  User? get currentUser => FirebaseAuth.instance.currentUser;
}
