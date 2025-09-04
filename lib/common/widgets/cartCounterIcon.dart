import 'package:flutter/material.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.counter = 0,
    this.iconColor,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final int counter;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(iconData, color: iconColor ?? Colors.black, size: 30,),
        ),
        Positioned(
          right: 3,
          top: 3,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counter > 0 ? Colors.red : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(100),
              
            ),
            child: Center(
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
