import 'package:emall/common/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.itemCount = 5,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, 
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: 16), 
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ShimmerEffect(width: 60, height: 60, radius: 30), 
              SizedBox(height: 8),
              ShimmerEffect(width: 60, height: 10, radius: 4), 
            ],
          );
        },
      ),
    );
  }
}