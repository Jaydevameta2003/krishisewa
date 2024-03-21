import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishisewa/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:krishisewa/src/features/authentication/screens/sign_up_screen/sign_up.dart';

import '../sign_in_screen/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => const OnBoardingScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Color(0xFFE4B975),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF583608),
                  ),
                ),
                Image(
                  image: const AssetImage(
                      'assets/images/on_boarding_images/welcome.png'),
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.off(() => const SignInScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF583608),
                            foregroundColor: Colors.white),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account'),
                        TextButton(
                          onPressed: () =>
                              Get.off(() => const SignUpScreen()),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Color(0xFF583608),
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
