import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:krishisewa/src/features/authentication/screens/location_services/locationservices.dart';
import 'package:krishisewa/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';

import '../home_screen/navigation_menu.dart';

class SplashServices{
  void isLogin(BuildContext context){

    Timer(const Duration(seconds: 3), () async{
      User? user = FirebaseAuth.instance.currentUser;

      if(user!= null){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const NavigationMenu()));
        getCurrentLocation();
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      }
    }
    );

  }
}