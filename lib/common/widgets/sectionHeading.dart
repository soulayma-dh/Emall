import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.onPressed,
    this.rightTextColor,
    this.textColor,
    this.buttonTitle = 'View all',
    required this.title,
    this.showActionButton = false,
  });

  final Color? textColor;
  final Color? rightTextColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            letterSpacing: 0.5,
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'OpenSans',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            style: ButtonStyle(
                textStyle:
                    WidgetStateProperty.all(TextStyle(color: rightTextColor))),
            onPressed: onPressed,
            child: Text(buttonTitle),
          ),
      ],
    );
  }
}
