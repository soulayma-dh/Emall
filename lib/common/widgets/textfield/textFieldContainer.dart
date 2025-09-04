import 'package:emall/utils/constants/colors.dart';
import 'package:emall/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    super.key,
    this.child,
    this.shadow
  });
  final Widget? child;
  final List<BoxShadow>? shadow;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: DeviceUtils.getScreenWidth(context) * 0.94,
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(color: borderColor, width: 2.0),
        boxShadow: shadow ?? [
          BoxShadow(
            color: Colors.black12.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
