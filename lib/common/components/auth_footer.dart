import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  final String text1;
  final String text2;
  final Function()? onTap;
  AuthFooter({super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
