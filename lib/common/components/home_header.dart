import 'package:emall/common/styles/textStyle.dart';
import 'package:emall/common/widgets/appbar.dart';
import 'package:emall/common/widgets/cartCounterIcon.dart';
import 'package:emall/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/device/device_utility.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              flex: 1,
              child: Container(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  height: DeviceUtils.getScreenHeight(context) * 0.5,
                  width: DeviceUtils.getScreenWidth(context),
                  child: Column(
                    children: [
                      CustomAppBar(
                        backgroundColor: Colors.transparent,
                        title: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good day for shooping',
                              style: TexttStyle.appBartitle,
                            ),
                            Text(
                              'Dhouioui Soulayma',
                              style: TexttStyle.appBarUser,
                            )
                          ],
                        ),
                        showBackArrow: false,
                        actions: [
                          CartCounterIcon(iconData: Icons.shopping_bag, onPressed: (){}, iconColor: Colors.white, counter: 3,)
                        ],
                      ),
                      
                    ],
                  )));
  }
}