import 'dart:async';

import 'package:flutter/material.dart';
import 'package:krishisewa/main.dart';
import 'package:krishisewa/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:krishisewa/src/features/authentication/screens/splash_screen/splash_services.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash_images/splashImage.png'),
                  fit: BoxFit.cover
              )
        ),
        )
      ),
    );
  }
}