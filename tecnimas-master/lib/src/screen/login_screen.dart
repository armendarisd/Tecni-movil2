import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecnimas/src/screen/register_screen.dart';

import 'package:tecnimas/src/utils/responsive.dart';
import 'package:tecnimas/src/widgets/custom_textfield.dart';

import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode _emailFocusNode = FocusNode();
    FocusNode _passwordFocusNode = FocusNode();

    final _authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Color(0xFFcef7a0),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: responsiveHeight(size: 30),
                  ),
                  Text(
                    "¡Hola!",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: (Color(0xFF413c58))),
                  ),
                  Container(
                    height: responsiveHeight(size: 15),
                  ),
                  Text(
                    "Estás a un login de limpiar tus cosas",
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      color: (Color(0xFF413c58)),
                    ),
                  ),
                  Container(height: responsiveHeight(size: 20)),
                  Icon(Icons.login_rounded, size: 120),
                  Container(height: responsiveHeight(size: 30)),
                  Container(height: responsiveHeight(size: 30)),
                  MyTextField(
                    label: "Correo",
                    focusNode: _emailFocusNode,
                    textEditingController: _emailController,
                  ),
                  Container(height: responsiveHeight(size: 30)),
                  MyTextField(
                    obscureText: true,
                    label: "Contraseña",
                    focusNode: _passwordFocusNode,
                    textEditingController: _passwordController,
                  ),
                  Container(height: responsiveHeight(size: 30)),
                  Container(
                    height: responsiveHeight(size: 40),
                  ),
                  Container(
                    child: CustomButton(
                      text: "Iniciar sesión",
                      onPressed: () {
                        _authController.signIn(
                            _emailController.text, _passwordController.text);
                      },
                    ),
                  ),
                  Container(
                    height: responsiveHeight(size: 30),
                  ),
                  GestureDetector(
                      onTap: () {
                        // Add your action here
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "¿Aún no tienes cuenta? ",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: (Color(0xFF413c58)),
                              ),
                            ),
                            Text(
                              "Registrate aquí",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: (Color(0xFF413c58)),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      )),
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
