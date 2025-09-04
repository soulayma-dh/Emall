import 'package:emall/common/widgets/roundedElevatedButton.dart';
import 'package:emall/features/authentification/Controller/login_controller.dart';
import 'package:emall/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/textfield/roundedTextField.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          RoundedTextField(
            controller: controller.email,
            hintText: 'EMAIL',
            validator: (value) => AppValidators.email(value),
            icon: Icons.email,
          ),
          SizedBox(
            height: 5,
          ),
          Obx(
            () => RoundedTextField(
              controller: controller.password,
              hintText: 'PASSWORD',
              icon: Icons.lock,
              obscureText: controller.isPasswordHidden.value,
              validator: (value) => AppValidators.password(value),
              suffixIcon: IconButton(
                  onPressed: controller.PasswordHidden,
                  icon: Icon(controller.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RoundedElevatedButton(
            press: () => controller.emailAndPasswordLogin()
            ,
            elevation: 8.0,
            color: Colors.white,
            text: "LOGIN",
          ),
        ],
      ),
    );
  }
}
