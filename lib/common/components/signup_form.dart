import 'package:emall/common/widgets/textfield/roundedTextField.dart';
import 'package:emall/features/authentification/Controller/signup_controller.dart';
import 'package:emall/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../widgets/roundedElevatedButton.dart';

class SignUpForm extends StatelessWidget {
 final controller = Get.put(SignUpController());
  SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormKey,
      child: Column(children: [
        RoundedTextField(
                  hintText: 'First Name',
                  icon: Iconsax.user_copy,
                  validator: (value) => AppValidators.fieldName(value, 'User Name'),
                  controller: controller.firstName,
                ),
                 SizedBox(
                  height: 5,
                ),
                RoundedTextField(
                  hintText: 'Last Name',
                  icon: Iconsax.user_copy,
                  validator: (value) => AppValidators.fieldName(value, 'User Name'),
                  controller: controller.lastName,
                ),
                 SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                 RoundedTextField(
                  hintText: 'Phone Number',
                  icon: Iconsax.call_copy,
                  validator: (value) => AppValidators.phone(value),
                  controller: controller.phoneNumber,
                ),
                SizedBox(
                  height: 5,
                ),
                RoundedTextField(
                  hintText: 'EMAIL',
                  icon: Iconsax.directbox_notif_copy,
                  validator:(value) => AppValidators.email(value) ,
                  controller: controller.email,
                ),
                SizedBox(
                  height: 10,
                ),
                 RoundedTextField(
                  hintText: 'PASSWORD',
                  obscureText: true,
                  icon: Iconsax.password_check_copy,
                  validator:(value) => AppValidators.password(value) ,
                  controller: controller.password,
                ),
                SizedBox(
                  height: 15,
                ),
                 
                
                RoundedElevatedButton(
                  press: () {
                     FocusScope.of(context).requestFocus(FocusNode());
                     controller.signup();
                   
                  },
                  elevation: 8.0,
                  color: Colors.white,
                  text: "SIGN UP",
                  
                ),
      ],),
    );
  }
}