import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../models/app_user.dart';

enum Status { uninitialized, authenticated, authenticating, unauthenticated }

enum SignInMethod { anonymous, google, facebook, email, notSignedIn }

class AuthUtil with ChangeNotifier {
  late final FirebaseAuth _auth;
  User? _user;
  GoogleSignIn? googleSignIn;
  Status _status = Status.uninitialized;
  SignInMethod _signInMethod = SignInMethod.notSignedIn;

  Status get status => _status;

  AuthUtil.instance() {
    _auth = FirebaseAuth.instance;
    _auth.authStateChanges().listen((u) {
      _onAuthStateChanged(u);
    });
  }

  AppUser? get getUser {
    return _user == null ? null : AppUser(id: _user!.uid);
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
      _signInMethod = SignInMethod.notSignedIn;
    } else {
      if (firebaseUser.emailVerified == false &&
          _signInMethod != SignInMethod.facebook) {
        _user = null;
        _status = Status.unauthenticated;
      } else {
        _user = firebaseUser;
        _status = Status.authenticated;
      }
    }
    notifyListeners();
  }

  Future<bool> signInAnom() async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth.signInAnonymously();
      _signInMethod = SignInMethod.anonymous;
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: "There was an error in signing in!");
      _status = Status.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInEmailPass(String email, String password) async {
    String? errorMessage;
    try {
      _status = Status.authenticating;
      notifyListeners();

      var uid = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (uid.user?.emailVerified == false) {
        throw FirebaseAuthException(
          code: 'not-verified',
        );
      }
      await _getSignedInUserData(uid);
      Fluttertoast.showToast(msg: "Login Successful");
      _status = Status.authenticated;
      _signInMethod = SignInMethod.email;
      return true;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        case "not-verified":
          errorMessage = "Email is not verified! Login Un-Sucessfull";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage);
      _status = Status.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      try {
        await _auth
            .signInWithCredential(facebookAuthCredential)
            .then((u) async {
          if (u.additionalUserInfo?.isNewUser == true) {
            await _postDetailsToFirestore(
              uid: u.user!.uid,
              name: u.user!.displayName == null ? "" : u.user!.displayName!,
              email: u.user!.email == null ? "" : u.user!.email!,
              photoUrl: u.user!.photoURL == null
                  ? 'assets/dummy_pic.png'
                  : u.user!.photoURL!,
              date: '',
            );
          } else {
            await _getSignedInUserData(u);
          }
          _signInMethod = SignInMethod.facebook;
        });
      } on FirebaseAuthException catch (error) {
        String? errorMessage;
        switch (error.code) {
          case "account-exists-with-different-credential":
            errorMessage = "This email is already registered on circle.";
            break;
          case "invalid-credential":
            errorMessage =
                "Error occurred while accessing credentials. Try again.";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with google is not enabled.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
      }
    }
  }

  Future signInWithGoogle() async {
    googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn?.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        await _auth.signInWithCredential(credential).then((u) async {
          if (u.additionalUserInfo?.isNewUser == true) {
            await _postDetailsToFirestore(
              uid: u.user!.uid,
              name: u.user!.displayName == null ? "" : u.user!.displayName!,
              email: u.user!.email == null ? "" : u.user!.email!,
              photoUrl: u.user!.photoURL == null
                  ? 'assets/dummy_pic.png'
                  : u.user!.photoURL!,
              date: '',
            );
          } else {
            await _getSignedInUserData(u);
          }
          _signInMethod = SignInMethod.google;
        });
      } on FirebaseAuthException catch (error) {
        String? errorMessage;
        switch (error.code) {
          case "account-exists-with-different-credential":
            errorMessage = "This email is already registered on circle.";
            break;
          case "invalid-credential":
            errorMessage =
                "Error occurred while accessing credentials. Try again.";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with google is not enabled.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _status = Status.unauthenticated;
    _signInMethod = SignInMethod.notSignedIn;
    notifyListeners();
  }

  Future signOutFromGoogle() async {
    if (!kIsWeb) {
      await googleSignIn?.signOut();
    }
    googleSignIn = null;
    await _auth.signOut();
    _status = Status.unauthenticated;
    _signInMethod = SignInMethod.notSignedIn;
    notifyListeners();
  }

  Future _postDetailsToFirestore({
    required String uid,
    required String name,
    required String email,
    required String date,
    String photoUrl = 'assets/dummy_pic.png',
  }) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    AppUser userModel = AppUser();

    userModel.id = uid;
    userModel.name = name;
    userModel.email = email;
    userModel.photoUrl = photoUrl;
    await firebaseFirestore
        .collection("Users")
        .doc(uid)
        .collection('Personal Information')
        .doc(uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }

  Future signUp({
    required String name,
    required String email,
    required String date,
    required String password,
  }) async {
    String? errorMessage;
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((u) async {
        await u.user?.sendEmailVerification();
        await _postDetailsToFirestore(
          uid: u.user!.uid,
          name: name,
          email: email,
          date: date,
        );
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "email-already-in-use":
          errorMessage = "The email is already registered on circle.";
          break;
        case "weak-password":
          errorMessage = "The password is too weak.";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage);
    }
  }

  Future _getSignedInUserData(UserCredential uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("Users")
        .doc(uid.user?.uid.toString())
        .collection('Personal Information')
        .doc(uid.user?.uid.toString())
        .get()
        .then((value) {
      currentUser_ = AppUser.fromDocument(value, uid.user?.uid.toString());
    });
  }

  Future sendResetLink(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: 'Reset Link Has been sent to your email!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for this email');
      }
    }
  }
}
