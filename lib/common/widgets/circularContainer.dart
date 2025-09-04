import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
 
  const CircularContainer({
    super.key,
    this.child,
    this.margin,
    this.padding,
    this.width ,
    this.height,
    this.radius = 400,
    this.showBorder = false,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.pink,
  });

  final Widget? child;
  final double? width;
  final double radius;
  final double? height;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}