import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tecnimas_admin/src/screen/register_screen.dart';

import '../controllers/auth_controller.dart';
import '../utils/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    getinitialPass() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = await prefs.getString('email');

      var pass = await prefs.getString('pass');

      if (pass != null && email != null) {
        setState(() {
          _emailController.text = email;
          _passwordController.text = pass;
        });
      }
    }

    getinitialPass();
    super.initState();
  }

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
                    "Revisa todos los pedidos",
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
                    controller: _emailController,
                  ),
                  Container(height: responsiveHeight(size: 30)),
                  MyTextField(
                    obscureText: true,
                    label: "Contraseña",
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Recordar contraseña",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: (Color(0xFF413c58)),
                        ),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Color(0xFF413c58),
                        value: _authController.rememberPass,
                        onChanged: (bool? value) {
                          setState(() {
                            _authController.changeCheck(value);
                          });
                        },
                      ),
                    ],
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
