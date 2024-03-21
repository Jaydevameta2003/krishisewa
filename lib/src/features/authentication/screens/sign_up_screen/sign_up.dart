import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krishisewa/src/features/authentication/controllers/signup_controller.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:krishisewa/src/features/authentication/screens/location_services/locationservices.dart';
import 'package:krishisewa/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:krishisewa/src/utils/utils.dart';

import '../home_screen/navigation_menu.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
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

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toastMessage(message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      ).then((value) {
        // Handle successful sign-up
        debugPrint("Sign up successful!");
        setState(() {
          loading = false;
        });
        // Navigate to home screen or perform other actions
        Get.off(() => const NavigationMenu());
        getCurrentLocation();
      }).catchError((error) {
        // Handle sign-up error
        debugPrint("Sign up failed: $error");
        // You can display a toast message or show an error dialog to the user
        setState(() {
          loading = false;
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => const WelcomeScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE4B975)
              ),
              height: size.height*0.96,
              child: Container(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.18,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color(0xFF583608),
                              ),
                            ),
                            Text('Content'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 350,
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline_outlined),
                                    label: Text('Full Name'),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    label: Text('E-Mail'),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter E-Mail';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: phoneController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone_outlined),
                                    label: Text('Phone No.'),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Phone No.';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.fingerprint_outlined),
                                    label: Text('Password'),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Password';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 35),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              signUp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF583608),
                            foregroundColor: Colors.white,
                          ),
                          child: loading ? const CircularProgressIndicator(strokeWidth: 3,color: Colors.white,):
                          const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text('OR'),
                      const SizedBox(height: 15),
                      Container(
                        height: 50,
                        width: 300,
                        child: OutlinedButton(
                          onPressed: () {
                            signInWithGoogle();
                          },
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
                              const SizedBox(width: 10,),
                              const Text(
                                'Sign-in with Google',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF583608),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
