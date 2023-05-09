import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecnimas/src/models/service_model.dart';
import 'package:tecnimas/src/screen/details_screen.dart';
import 'package:tecnimas/src/screen/home_screen.dart';
import 'package:tecnimas/src/screen/services_screen.dart';

import 'package:tecnimas/src/widgets/custom_appbar.dart';
import 'package:tecnimas/src/widgets/custom_button.dart';

import '../controllers/services_controllert.dart';
import '../utils/responsive.dart';
import '../widgets/labor_card.dart';

class MadeScreen extends StatefulWidget {
  const MadeScreen({super.key});

  @override
  State<MadeScreen> createState() => _MadeScreenState();
}

class _MadeScreenState extends State<MadeScreen> {
  final ServicesController servicesController = Get.put(ServicesController());

  @override
  void initState() {
    servicesController.servicesList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomPreferredSize(text: "Pedido realizado"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 40,
                ),
                Container(
                  child: ClipOval(
                    child: Image.asset("assets/clean.gif"),
                  ),
                ),
                Container(
                  height: 40,
                ),
                Column(
                  children: [
                    Container(
                      width: responsiveWidth(size: 220),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Pedido realizado",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w700,
                                fontSize: responsiveFontSize(32, null),
                                color: (Color(0xFF413c58)),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Text(
                              "Gracias por confiar en nosotros, pronto estaremos en tu casa,o nos pondremos en contacto",
                              style: GoogleFonts.lato(
                                fontSize: responsiveFontSize(20, null),
                                color: (Color(0xFF413c58)),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          fontSize: responsiveFontSize(17, null),
                          text: "Realizar nuevo pedido",
                          width: responsiveHeight(size: 130),
                          onPressed: () => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ServicesScreen()),
                            )
                          },
                        ),
                        SizedBox(
                          width: responsiveWidth(size: 20),
                        ),
                        CustomButton(
                          text: "Inicio",
                          width: responsiveHeight(size: 130),
                          onPressed: () => {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                              (Route<dynamic> route) => false,
                            )
                          },
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
