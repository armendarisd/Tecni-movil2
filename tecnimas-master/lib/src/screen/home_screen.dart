import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecnimas/src/controllers/auth_controller.dart';
import 'package:tecnimas/src/screen/services_screen.dart';
import 'package:tecnimas/src/utils/responsive.dart';

import '../controllers/services_controllert.dart';
import '../widgets/card_history.dart';
import '../widgets/custom_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final ServicesController servicesController = Get.put(ServicesController());

    return Scaffold(
      body: Column(
        children: [
          initialAppbar(authController),
          servicesController.orders.isEmpty
              ? Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Text(
                        "No hay ordenes",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          fontSize: responsiveFontSize(32, null),
                          color: (Color(0xFF413c58)),
                        ),
                      ),
                      ClipOval(
                        child: Image.asset("assets/clean.gif"),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: servicesController.orders.length,
                    itemBuilder: (context, index) {
                      final order = servicesController.orders[index];
                      return Container(child: cardHistory(order));
                    },
                  ),
                ),
          Container(
            height: 70,
          ),
          CustomButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ServicesScreen()),
              )
            },
            text: 'Realizar pedido',
          ),
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }
}

Container initialAppbar(AuthController authController) {
  return Container(
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
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "¡Hola!  ${authController.displayName}",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: responsiveFontSize(32, null),
              color: (Color(0xFF413c58)),
            ),
          ),
        ),
        IconButton(
          onPressed: () => {authController.signOut()},
          icon: Icon(Icons.logout),
        ),
      ],
    ),
  );
}
