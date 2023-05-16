import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'package:firebase_core/firebase_core.dart';

import 'controller_bindings.dart';
import 'src/controllers/auth_controller.dart';
import 'src/screen/home_screen.dart';
import 'src/screen/login_screen.dart';

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
      title: 'Tecni+ Admin',
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
