
import 'package:emall/utils/constants/colors.dart';
import 'package:emall/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class RoundedElevatedButton extends StatelessWidget {
  late Function()? press;
  final String? text;
  final Color? color;
  final Color? backColor;
  final double? elevation;
  RoundedElevatedButton(
      {super.key, this.press, this.text, this.backColor, this.color, this.elevation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceUtils.getScreenWidth(context) * 0.94,
      child: ElevatedButton(
        onPressed: press,
          style: ElevatedButton.styleFrom(
          elevation: elevation,
          foregroundColor: Colors.white,
          backgroundColor: color,
          disabledBackgroundColor: backColor,
          side: const BorderSide(color: borderColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          
 
        ),
        child: Text(
          text!,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: borderColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  
  }
}
