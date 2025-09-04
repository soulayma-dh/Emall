import 'package:emall/common/widgets/profileMenuWidget.dart';
import 'package:emall/controllers/user_controller.dart';
import 'package:emall/features/authentification/Views/login_page.dart';
import 'package:emall/utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final _auth = FirebaseAuth.instance;
  final controller = UserController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          children: [
            //IMAGE
            Stack(
              children: [
                Obx(() {
                  final user = controller.user.value;
                  return CircleAvatar(
                    foregroundColor: Colors.white,
                    radius: 60,
                    backgroundImage: user.profilePicture.isNotEmpty
                        ? NetworkImage(user.profilePicture)
                        : const AssetImage('assets/images/default_avatar.png')
                            as ImageProvider,
                  );
                }),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: GestureDetector(
                    onTap: () {
                      controller.uploadUserProfilePicture();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: primaryColor,
                      ),
                      child: const Icon(
                        Iconsax.edit_2_copy,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            /// -- USER INFO
            Text(
              '${controller.user.value.firstName} ${controller.user.value.lastName}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              '${controller.user.value.email}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),

            /// -- MENU
            ProfileMenuWidget(
              title: "Settings",
              icon: Iconsax.settings_copy,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            ProfileMenuWidget(
              title: "Adresses",
              icon: Iconsax.information_copy,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            ProfileMenuWidget(
              title: "Security",
              icon: Iconsax.security_copy,
              onPress: () {},
            ),
            const SizedBox(height: 20),

            /// -- LOGOUT BUTTON
            ProfileMenuWidget(
              title: "Logout",
              icon: Iconsax.logout_1_copy,
              textColor: Colors.red,
              endIcon: false,
              onPress: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Logout",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    content: const Text("Are you sure you want to logout?",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text("Cancel",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                      TextButton(
                        onPressed: () async {
                          await _auth.signOut();
                          Get.offAll(LoginPage());
                        },
                        child: const Text("Logout",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
