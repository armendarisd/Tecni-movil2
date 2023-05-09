import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecnimas/src/controllers/auth_controller.dart';
import 'package:tecnimas/src/screen/history_screen.dart';
import 'package:tecnimas/src/screen/services_screen.dart';
import 'package:tecnimas/src/utils/responsive.dart';

import '../widgets/menu_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Color(0xFFcef7a0),
                ),
                height: responsiveHeight(size: 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "¡Hola!  ${_authController.displayName}",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: responsiveFontSize(32, null),
                            color: (Color(0xFF413c58)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () => {_authController.signOut()},
                        icon: Icon(Icons.logout),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(height: 40),
                  Wrap(
                    spacing: 30, // horizontal spacing between the containers
                    runSpacing: 20, // vertical spacing between the containers
                    children: [
                      MenuCard(
                        iconData: Icons.cleaning_services,
                        title: "Servicios de limpieza",
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServicesScreen()),
                          )
                        },
                        color: Colors.blue.shade700,
                        text:
                            "Solicita nuestros servicios, limpiamos tus muebles a domicilio.",
                      ),
                      // MenuCard(
                      //   iconData: Icons.person,
                      //   title: "Mi perfil",
                      //   color: Colors.green,
                      //   text:
                      //       "Revisa tus datos, actualiza tu dirección y número de teléfono.",
                      // ),
                      // MenuCard(
                      //   iconData: Icons.info,
                      //   title: "Sobre nosotros",
                      //   color: Colors.cyan.shade400,
                      //   text:
                      //       "Somos tu app favorita de limpieza, vista nuestras redes sociales y mira donde estamos disponible",
                      // ),
                      MenuCard(
                        iconData: Icons.history,
                        title: "Historial",
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryScreen()),
                          )
                        },
                        color: Colors.blueGrey,
                        text:
                            "Aquí podrás revisar los pedidos que has realizado a detalle",
                      ),
                    ],
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
