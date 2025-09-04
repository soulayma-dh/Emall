import 'package:flutter/material.dart';

class GestureTile extends StatelessWidget {
  final String title;
  final String image;
  final Color backgroundColor;
  final Color? textColor;
  final Color? imageColor;
  final VoidCallback? onTap;

  GestureTile({
    super.key,
    required this.title,
    required this.image,
    required this.backgroundColor,
    this.textColor,
    this.imageColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Container(
              width: 55,
              height: 55,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  color: imageColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: TextStyle(
                  letterSpacing: 0.5,
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
