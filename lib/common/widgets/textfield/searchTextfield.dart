import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class SearchTextField extends StatelessWidget {

  const SearchTextField({super.key, this.shadow, this.border});
  final bool? shadow ;
  final bool? border; 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 50,
      width: DeviceUtils.getScreenWidth(context) - 40,
      decoration: BoxDecoration(
        border: border==true ? Border.all(color: Colors.black) : null,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: shadow == true ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ] : null 
      ),
      child: TextFormField(
        onTap: () {},
        decoration: const InputDecoration(
            icon: Icon(
              Iconsax.search_normal_1_copy,
              color: borderColor,
            ),
            hintText: 'Search in Store',
            hintStyle: TextStyle(fontFamily: 'OpenSans', color: borderColor),
            border: InputBorder.none),
      ),
    );
  }
}
