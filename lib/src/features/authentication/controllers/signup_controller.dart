import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishisewa/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}