
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:krishisewa/src/features/authentication/screens/sign_in_screen/sign_in_screen.dart';

import '../../../../../services/popup.dart';


class PasswordRecovery extends StatefulWidget{
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {

  final emailController = TextEditingController();
  bool loading = false;

  Future verifyEmail() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
  }

  final PopUp popUp = PopUp();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{
        Get.off(()=> const SignInScreen());
        return false;
      },
      child: Scaffold(
        body :SafeArea(
          child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFE4B975)
                ),
                height: size.height*0.96,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: 600,
                      decoration: BoxDecoration(
                          color :Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.email_outlined, size: 100,color: Color(0xFF583608),),
                          const SizedBox(height: 40,),
                          const Text('Receive an email to reset your', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF583608)),),
                          const Text('password', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF583608)),),
                          const SizedBox(height: 40,),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined, size: 30,color: Color(0xFF583608)),
                              label: Text('E-Mail'),
                              border: OutlineInputBorder(),
          
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Container(
                            height: 50,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                popUp.successMessage('Recovery email has been sent to ${emailController.text.trim()}');
                                verifyEmail();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF583608),
                              ),
                              child: loading
                                  ? const CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              )
                                  : const Text(
                                'Send Mail',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
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
        ),
    );
  }
}