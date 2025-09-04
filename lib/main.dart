import 'package:emall/bindings/general_bindings.dart';
import 'package:emall/features/authentification/repository/authentification_repository.dart';
import 'package:emall/firebase_options.dart';
import 'package:emall/routes.dart';
import 'package:emall/features/authentification/Views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  //Firebase initialisation
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthentificationRepository()));
  //Getx local storage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //the root of  application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'EMALL',
      home: LoginPage(),
    );
  }
}
