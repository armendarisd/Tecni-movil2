import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:google_fonts/google_fonts.dart';

import '../controllers/auth_controller.dart';
import '../utils/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    FocusNode _nameFocusNode = FocusNode();
    FocusNode _emailFocusNode = FocusNode();
    FocusNode _passwordFocusNode = FocusNode();
    FocusNode _confirmPasswordFocusNode = FocusNode();

    return Scaffold(
      backgroundColor: Color(0xFFcef7a0),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: responsiveHeight(size: 30),
                  ),
                  Text(
                    "¡Hola, Registrate!",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: (Color(0xFF413c58))),
                  ),
                  Container(
                    height: responsiveHeight(size: 15),
                  ),
                  Text(
                    "Te ahorraremos tiempo y esfuerzo.",
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      color: (Color(0xFF413c58)),
                    ),
                  ),
                  Container(height: responsiveHeight(size: 25)),
                  Icon(Icons.bathroom, size: 120),
                  Container(height: responsiveHeight(size: 50)),
                  MyTextField(
                    label: "Nombre",
                    focusNode: _nameFocusNode,
                    controller: _nameController,
                  ),
                  Container(height: responsiveHeight(size: 20)),
                  MyTextField(
                    label: "Correo",
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                  ),
                  Container(height: responsiveHeight(size: 20)),
                  MyTextField(
                    label: "Contraseña",
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  Container(height: responsiveHeight(size: 20)),
                  MyTextField(
                    label: "Confirmar Contraseña",
                    focusNode: _confirmPasswordFocusNode,
                    controller: _confirmPasswordController,
                    obscureText: true,
                  ),
                  Container(
                    height: responsiveHeight(size: 40),
                  ),
                  Container(
                    child: CustomButton(
                      text: "Registrarme",
                      onPressed: () {
                        if (_nameController.text.trim() == "") {
                          Get.snackbar("Campo faltante", "Nombre",
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (_emailController.text.trim() == "") {
                          Get.snackbar("Campo faltante", "Correo electrónico",
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (_passwordController.text.trim() == "") {
                          Get.snackbar("Campo faltante", "Contraseña",
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (_confirmPasswordController.text.trim() ==
                            "") {
                          Get.snackbar("Campo faltante", "Contraseña",
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (_confirmPasswordController.text !=
                            _passwordController.text) {
                          Get.snackbar("Campo faltante",
                              "Las contraseñas deben ser la misma",
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else {
                          _authController.signUp(_nameController.text,
                              _emailController.text, _passwordController.text);
                        }

                        _emailFocusNode.unfocus();
                        _passwordFocusNode.unfocus();
                      },
                    ),
                  ),
                  Container(
                    height: responsiveHeight(size: 30),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
