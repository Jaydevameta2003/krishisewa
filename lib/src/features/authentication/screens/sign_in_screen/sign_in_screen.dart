import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:krishisewa/src/features/authentication/screens/location_services/locationservices.dart';
import 'package:krishisewa/src/features/authentication/screens/password_recovery_screen/password_recovery.dart';
import 'package:krishisewa/src/features/authentication/screens/sign_up_screen/sign_up.dart';
import 'package:krishisewa/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:krishisewa/services/popup.dart';

import '../home_screen/navigation_menu.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final PopUp popUp = PopUp();
  bool loading = false;

  Future<void> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try{
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if(googleUser == null){
        return;
      }
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await  FirebaseAuth.instance.signInWithCredential(credential);

      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if(firebaseUser != null){
        Get.to(()=> const NavigationMenu());
        getCurrentLocation();
      }
    }catch(error){
      debugPrint('error $error');
    }
  }


  void _login() {
    setState(() {
      loading = true;
    });

    _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ).then((value) {
      // Handle successful sign-in
      debugPrint("Sign in successful!");
      Get.off(() => const NavigationMenu ());
      getCurrentLocation();
      setState(() {
        loading = false;
      });
      // Navigate to home screen or perform other actions
    }).catchError((error) {
      popUp.toastMessage("Enter valid E-Mail and Password");
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => const WelcomeScreen());
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE4B975)
              ),
              child: Container(
                height: size.height * 0.96,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.2,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF583608)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline_outlined),
                                      label: Text('E-Mail'),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.fingerprint),
                                      label: const Text('Password'),
                                      border: const OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.remove_red_eye_sharp),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Email';
                                      }
                                      return null;
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.off(() => const PasswordRecovery());
                                      },
                                      child: const Text(
                                        'Forget Password?',
                                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Color(0xFF583608)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    _login(); // Call the login function if form validation succeeds
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: const Color(0xFF583608),
                                  foregroundColor: Colors.white,
                                ),
                                child: loading
                                    ? const CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                )
                                    : const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text('OR', textAlign: TextAlign.end),
                            const SizedBox(height: 20),
                            GestureDetector(
                              child: Container(
                                width: 300,
                                height: 50,
                                child: OutlinedButton(
                                  onPressed: () {
                                    signInWithGoogle();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    foregroundColor: const Color(0xFF583608),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: Image.asset(
                                          'assets/images/on_boarding_images/google.png', // Provide the correct image file name
                                          height: 20, // Set the height to match the container
                                        ),
                                      ),
                                      const SizedBox(width: 10), // Add some space between the image and text
                                      const Text('Sign-In with Google', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an account? '),
                                TextButton(
                                  onPressed: () => Get.off(() => const SignUpScreen()),
                                  style: TextButton.styleFrom(foregroundColor: const Color(0xFF583608)),
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
