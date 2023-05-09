import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:tecnimas/controller_bindings.dart';
import 'package:tecnimas/src/controllers/auth_controller.dart';
import 'package:tecnimas/src/screen/home_screen.dart';
import 'package:tecnimas/src/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      title: 'Tecni+',
      theme: ThemeData(),
      home: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
              child: _.userProfile != null ? const Home() : const Login());
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
