import 'package:emall/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeader extends StatelessWidget {
 final double? heightHeader;
 final String title;
 final String subtitles;
 final String img; 

  const AuthHeader({super.key, this.heightHeader, required this.title, required this.subtitles, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: double.infinity,
      height: heightHeader,
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.openSans(
              fontSize: DeviceUtils.getScreenHeight(context) * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            subtitles,
            style: GoogleFonts.openSans(
              fontSize: DeviceUtils.getScreenHeight(context) * 0.02,
              fontWeight: FontWeight.w100,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                img,
                width: DeviceUtils.getScreenWidth(context)*0.9,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
