import 'package:emall/common/components/auth_header.dart';
import 'package:emall/common/components/login_form.dart';
import 'package:emall/common/components/auth_footer.dart';
import 'package:emall/routes.dart';
import 'package:emall/utils/constants/colors.dart';
import 'package:emall/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthHeader(
                  heightHeader: DeviceUtils.getScreenHeight(context) * 0.5,
                  title: 'Welcome Back To EMALL !',
                  subtitles: 'With EMALL, big dreams come small',
                  img: "assets/images/login_image.jpg"),
              SizedBox(height: 40),
              LoginForm(),
              SizedBox(height: 20),
              AuthFooter(
                  text1: "Don't have an account?",
                  text2: "Sign up",
                  onTap: () {
                    Get.toNamed(AppRoutes.signUp);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
