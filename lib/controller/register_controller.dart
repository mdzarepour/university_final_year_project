import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/components/constants/api_constants.dart';
import 'package:tech_blog/components/constants/const_storage.dart';
import 'package:tech_blog/services/dio_services.dart';
import 'package:tech_blog/view/write/write_blog.dart';
import 'dart:developer' as developer;

class RegisterController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController activationCodeEditingController =
      TextEditingController();
  var email = '';
  var userId = '';
  registerationMethod() async {
    Map<String, dynamic> map = {
      'email': emailEditingController.text,
      'command': 'register'
    };
    var response =
        await DioServices().postMethod(map, ApiConstants.postRegister);
    email = emailEditingController.text;
    userId = response.data['user_id'];
  }

  verfyCodeMethod() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activationCodeEditingController.text,
      'command': 'verify'
    };

    var response =
        await DioServices().postMethod(map, ApiConstants.postRegister);
    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(ConstStorage.token, response.data['token']);
      box.write(ConstStorage.userId, response.data['user_id']);
      developer.log(response.data['token']);
      developer.log(response.data['user_id']);
      Get.to(() => WriteBlog());
    } else {
      print('erorrrrrrrrrrrrrrrrr');
    }
  }
}
