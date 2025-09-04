import 'package:emall/common/components/auth_footer.dart';
import 'package:emall/common/components/signup_form.dart';
import 'package:emall/common/components/auth_header.dart';
import 'package:emall/routes.dart';
import 'package:emall/utils/constants/colors.dart';
import 'package:emall/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              heightHeader: DeviceUtils.getScreenHeight(context) * 0.4,
              title: 'Create Your Account',
              subtitles: 'Your gateway to great deals',
              img: 'assets/images/signup_image.jpg',
            ),
            SizedBox(height: 20),
            SignUpForm(),
            SizedBox(height: 20),
            AuthFooter(
              text1: "Already have an account",
              text2: "Login",
              onTap: () {
                Get.toNamed(AppRoutes.login);
              },
            )
          ],
        ),
      ),
    ));
  }
}
