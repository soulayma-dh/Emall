import 'package:emall/common/components/product_cart_v.dart';
import 'package:emall/common/components/prompslider.dart';
import 'package:emall/common/layouts/grid_layout.dart';
import 'package:emall/common/widgets/appbar.dart';
import 'package:emall/common/styles/textStyle.dart';
import 'package:emall/common/widgets/cartCounterIcon.dart';
import 'package:emall/common/widgets/textfield/searchTextfield.dart';
import 'package:emall/common/widgets/sectionHeading.dart';
import 'package:emall/controllers/user_controller.dart';
import 'package:emall/features/home/view/home_categories.dart';
import 'package:emall/utils/constants/colors.dart';
import 'package:emall/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});
  final controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Header
              Container(
                  height: DeviceUtils.getScreenHeight(context) * 0.37,
                  width: DeviceUtils.getScreenWidth(context),
                  child: Column(
                    children: [
                      //HomeAppBar
                      CustomAppBar(
                        backgroundColor: Colors.transparent,
                        title:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good day for shooping',
                              style: TexttStyle.appBartitle,
                            ),
                          Obx(() => Text(
                                "${controller.user.value.firstName} ${controller.user.value.lastName} ",
                                style: TexttStyle.appBarUser,
                              ),
                            )
                          ],
                        ),
                        showBackArrow: false,
                        actions: [
                          CartCounterIcon(
                            iconData: Iconsax.shopping_bag_copy,
                            onPressed: () {},
                            iconColor: Colors.white,
                            counter: 3,
                          )
                        ],
                      ),
                      SizedBox(height: 23),
      
                      //Search
                      const SearchTextField(shadow: true,),
                      SizedBox(height: 18),
      
                      //Categories
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: const SectionHeading(
                            title: 'Categories:',
                            textColor: Colors.white,
                          )),
                      const SizedBox(height: 7),
                     HomeCategories()
                    ],
                  )),
              //FooTer
              Container(
               
                width: DeviceUtils.getScreenWidth(context),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: PromoSlider(banners: [
                        'assets/images/promo3.png',
                        'assets/images/promo1.png',
                        'assets/images/promo2.jpg',
                        'assets/images/promo4.jpg',
                      ]),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child:SectionHeading(title: 'Popular Products',showActionButton: true, onPressed: (){},)
                  ),
                  GridLayout(itemCount: 2, itemBuilder: (_, index)=>
                    ProductCartV()
                  )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
