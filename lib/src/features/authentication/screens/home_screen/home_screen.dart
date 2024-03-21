
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krishisewa/services/popup.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/news/newshome.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/side_menu.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/weather/loading.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/weather/weatherhome.dart';
import 'package:krishisewa/src/features/authentication/screens/sign_in_screen/sign_in_screen.dart';
import 'package:krishisewa/src/features/authentication/screens/welcome/welcome_screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final PopUp popUp = PopUp();

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFE4B975),),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFFCF3F8),
            height: MediaQuery.of(context).size.height*0.89,
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Color(0xFFE4B975),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(24))
                  ),
                  child: Column(
                    children: [
                      Text('Welcome', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF583608)),),
                      Text('to',style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF583608)),),
                      Text('Krishi Sewa',style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800,color: Color(0xFF583608)),)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quick Access', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Get.off(()=> const Loading());
                                },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(right: 3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(width: 2, color: Color(0xFF583608)),
                                      color: Color(0xFFE4B975)
                                    ),
                                    height: 100,
                                    child: const Row(
                                      children: [
                                        Icon(Icons.cloud_outlined,size: 30,color: Color(0xFF583608),),
                                        SizedBox(width: 20,),
                                        Text('Weather', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF583608)),)
                                      ],
                                    ),
                                  )
                              )
                          ),
                          Expanded(child: GestureDetector(
                            onTap: (){
                              Get.off(()=> const NewsHome());
                            },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(left: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: 2, color: Colors.black),
                                  color: const Color(0xFFB0BCBC),
                                ),
                                height: 100,
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/news_images/news.png',height: 30,width: 30,),
                                    const SizedBox(width: 20,),
                                    const Text('News', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              )
                          )),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20,),
                TextButton(
                    onPressed: (){
                      GoogleSignIn().disconnect();
                      _auth.signOut().then((value){
                        Get.off(()=> const SignInScreen());
                      }).onError((error, stackTrace){
                        popUp.toastMessage(error);
                      });

                    },
                    child: const Text('Sign Out')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
