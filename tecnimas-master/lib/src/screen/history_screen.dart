import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecnimas/src/widgets/custom_appbar.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl

import '../controllers/auth_controller.dart';
import '../controllers/services_controllert.dart';
import '../utils/responsive.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ServicesController servicesController = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomPreferredSize(text: "Historial"),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              height: 30,
            ),
            Obx(() => Row(
                  children: servicesController.orders.map((order) {
                    return Row(
                      children: [
                        Container(
                          height: 440,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: ListView(children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                "Fecha   ${order.date.day}/${order.date.month}/${order.date.year}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                "Hora   ${order.date.hour}:${NumberFormat('##').format(order.date.minute)}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Servicios', // Agrega el símbolo de peso y formatea el número con separadores de miles
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Column(
                              children: order.services
                                  .map((service) => Text(service.name))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Costo \$${NumberFormat('#,###').format(order.price)}', // Agrega el símbolo de peso y formatea el número con separadores de miles
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Direccion: ${order.address}', // Agrega el símbolo de peso y formatea el número con separadores de miles
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Estado: ${order.address}', // Agrega el símbolo de peso y formatea el número con separadores de miles
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ]),
                        ),
                        Container(
                          height: 20,
                        ),
                      ],
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }
}
