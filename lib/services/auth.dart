import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krishisewa/services/popup.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/navigation_menu.dart';
import '../src/features/authentication/screens/home_screen/home_screen.dart';
import 'database.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final PopUp popUp = PopUp();

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Sign out of the current Google session
    await googleSignIn.signOut();

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        final User? userDetails = userCredential.user;

        if (userDetails != null) {
          Map<String, dynamic> userInfoMap = {
            "email": userDetails.email,
            "name": userDetails.displayName,
            "imgUrl": userDetails.photoURL,
            "id": userDetails.uid,
          };
          Get.off(() => const NavigationMenu());
        } else {
          popUp.toastMessage('Failed to sign in. Please try again.');
        }
      } else {
        popUp.toastMessage('Please select a method to sign in.');
      }
    } catch (e) {
      debugPrint("Error signing in with Google: $e");
      popUp.toastMessage('Failed to sign in. Please try again.');
    }
  }



//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool _isSignedOut = false;
//
//   popup PopUp = popup();
//
//   Future<void> signInWithGoogle(BuildContext context) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//
//     try {
//       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         // Obtain fresh authentication data
//         final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//         // Use fresh tokens for sign-in
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken,
//         );
//
//         final UserCredential userCredential = await _auth.signInWithCredential(credential);
//         final User? userDetails = userCredential.user;
//
//         if (userDetails != null) {
//           Map<String, dynamic> userInfoMap = {
//             "email": userDetails.email,
//             "name": userDetails.displayName,
//             "imgUrl": userDetails.photoURL,
//             "id": userDetails.uid,
//           };
//         } else {
//           // Handle null user details
//           // You might want to show an error message or log the error
//         }
//       } else {
//         // Handle null Google sign-in account
//         // You might want to show an error message or log the error
//       }
//     } catch (e) {
//       // Handle sign-in errors
//       debugPrint("Error signing in with Google: $e");
//       // You might want to show an error message to the user
//     }
//   }
//
//
//
//   // Method to sign out the user
//   Future<void> signOut() async {
//     await _auth.signOut();
//     _isSignedOut = true; // Set the signed out flag
//   }
// }
}