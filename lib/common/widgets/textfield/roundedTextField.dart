import 'package:emall/common/widgets/textfield/textFieldContainer.dart';
import 'package:emall/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedTextField extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget?  suffixIcon ;

  bool obscureText;
  RoundedTextField(
      {super.key,
      this.suffixIcon,
      this.icon,
      this.hintText,
      this.controller,
      this.validator,
      this.onChanged,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        cursorColor: borderColor,
        validator: validator,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: borderColor,
            ),
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
      ),
    );
  }
}
