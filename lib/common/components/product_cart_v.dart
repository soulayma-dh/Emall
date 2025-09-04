import 'package:emall/common/styles/textStyle.dart';
import 'package:emall/screens/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../widgets/circularContainer.dart';
import '../widgets/circularIcon.dart';
import '../widgets/roundedImage.dart';

class ProductCartV extends StatelessWidget {
  const ProductCartV({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Get.to(ProductDetailsPage());},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircularContainer(
                radius: 20,
                child: Stack(
                  children: [
                    RoundedImage(
                      width: 180,
                      height: 170,
                      image: 'assets/images/product2.jpg',
                    ),
                    Positioned(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text('65%')),
                      top: 10,
                      left: 10,
                    ),
                    Positioned(
                      child: CircularIcon(
                        icon: Iconsax.heart,
                        color: Colors.red,
                        size: 25,
                      ),
                      top: 2,
                      right: 1,
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Robe satiné ',
                style: TexttStyle.productName,
              ),
              Row(
                children: [
                  Text(
                    'ZARA',
                    style: TexttStyle.brandName,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Iconsax.verify,
                    color: Colors.blue,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$55.5 ',
                    style: TexttStyle.price,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: SizedBox(
                      width: 45,
                      height: 35,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
