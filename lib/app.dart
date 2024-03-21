import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishisewa/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:krishisewa/src/utils/theme/theme.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home:const SplashScreen(),
    );
  }
}